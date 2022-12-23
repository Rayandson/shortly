import bcrypt from "bcrypt";
import { v4 as uuid } from 'uuid';
import {connectionDB} from "../database/db.js"

export async function signUp(req, res) {
    const {name, email, password} = req.body;

        try {
                const hashPassword = bcrypt.hashSync(password, 10)
                await connectionDB.query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3);',[name, email, hashPassword])
                res.sendStatus(201)
        } catch (err) {
            res.status(500).send(err.message)
        }
   
}

export async function signIn(req, res) {
    const user = res.locals.user;

    const token = uuid()

    try {
        const session = await connectionDB.query('SELECT * FROM sessions WHERE "userId" = $1',[user.id])

        if(session.rowCount === 0) {
            await connectionDB.query('INSERT INTO sessions (token, "userId") VALUES ($1, $2);',[token, user.id])
            return res.status(200).send({...user, token})
        }
        return res.status(200).send({...user, token:session.rows[0].token})
               
    } catch(err) {
        res.status(500).send(err.message) 
    }
}