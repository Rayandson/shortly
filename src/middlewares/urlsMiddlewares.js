import { connectionDB } from "../database/db.js";
import { urlsSchemma } from "../schemas/urlsSchema.js";

export function validateUrlsSchema(req, res, next) {

    const url = req.body
    const { error } = urlsSchemma.validate(url, { abortEarly: false });

    if (error) {
      const errors = error.details.map((detail) => detail.message);
      return res.status(400).send({ errors });
    }

    next();
}

export async function validateShortUrl(req, res, next) {

    const { shortUrl } = req.params;

    const urlExists = await connectionDB.query(`SELECT * FROM urls WHERE "shortUrl" = $1;`, [shortUrl])
    await connectionDB.query('UPDATE urls SET "visitCount"=$1 WHERE id = $2;', [urlExists.rows[0].visitCount + 1, urlExists.rows[0].id])


    if(urlExists.rowCount === 0) {
        return res.sendStatus(404);
    }

    res.locals.url = urlExists.rows[0];
    next();
}

export async function deletePermission(req, res, next) {

    const urlId = req.params.id;
    const userId = res.locals.userId;

    const url = await connectionDB.query('SELECT * FROM urls WHERE id = $1;', [urlId]);

    if(url.rowCount === 0) {
        return res.sendStatus(404);
    }

    if(url.rows[0].userId !== userId) {
        return res.sendStatus(401);
    }

    next()
}