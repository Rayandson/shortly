import { connectionDB } from "../database/db.js";

export async function findAll(req, res) {

    const userId = res.locals.userId;

    const user = await connectionDB.query('SELECT * FROM users WHERE id = $1;', [userId]) 

    if(user.rowCount === 0) {
        return res.sendStatus(404)
    }

    const urls = await connectionDB.query(`SELECT users.id, users.name, SUM(urls."visitCount") AS "visitCount", json_agg(json_build_object('id', urls.id, 'shortUrl', urls."shortUrl", 'url', urls.url, 'visitCount', urls."visitCount")) AS shortenedUrls FROM users JOIN urls ON users.id = urls."userId" WHERE users.id = $1 GROUP BY users.id;`, [userId]) 

    res.status(200).send(urls.rows[0])
}

export async function ranking(req, res) {

    const ranking = await connectionDB.query(`SELECT users.id, users.name, COUNT(urls.id) AS "linksCount", COALESCE(SUM(urls."visitCount"), 0) AS "visitCount" FROM users LEFT JOIN urls ON users.id = urls."userId" GROUP BY users.id ORDER BY "visitCount" DESC, "linksCount" DESC LIMIT 10`)

    res.status(200).send(ranking.rows) 
}