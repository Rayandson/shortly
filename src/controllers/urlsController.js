import {connectionDB} from "../database/db.js"
import { nanoid } from 'nanoid'

export async function create(req, res) {

    const { url } = req.body;
    const shortUrl = nanoid(8);

    const userId = res.locals.userId;
    console.log(userId)
    
    try {

        await connectionDB.query('INSERT INTO urls (url, "shortUrl", "visitCount", "userId") VALUES ($1, $2, $3, $4);',[url, shortUrl, 0, userId])
        res.status(201).send({shortUrl})
    } catch(err) {

        res.status(500).send(err.message)

    }
    
}

export async function findById(req, res) {
    const { id } = req.params;

    try {
        const { rows } = await connectionDB.query('SELECT * FROM urls WHERE id =  $1;',[id])

        if(rows.length === 0) {
            return res.sendStatus(404);
        }
        
        delete rows[0].visitCount
        delete rows[0].userId

    res.status(200).send(rows[0])
    } catch(err) {
        res.status(500).send(err.message)
    }
    
}

export async function redirect(req, res) {

    const { url } = res.locals.url;
    res.redirect(url);
}

export async function remove(req, res) {

    const urlId = req.params.id;

    try {
        await connectionDB.query('DELETE FROM urls WHERE id = $1;',[urlId])

        res.sendStatus(204);
    } catch(err) {
        res.status(500).send(err.message)
    }
    
}
