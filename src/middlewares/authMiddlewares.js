import { signUpSchemma } from "../schemas/signUpSchema.js";
import { signInSchemma } from "../schemas/signInSchema.js";
import { connectionDB } from "../database/db.js";
import bcrypt from "bcrypt";

export async function validateSignUp ( req, res, next) {
    
    const user = req.body;

    const { error } = signUpSchemma.validate(user, { abortEarly: false });

    if (error) {
      const errors = error.details.map((detail) => detail.message);
      return res.status(400).send({ errors });
    }

    try {
        const userExists = await connectionDB.query('SELECT * FROM users WHERE email = $1;', [user.email])
            if (userExists.rowCount !== 0) {
                return res.status(409).send("O usuário já existe!")
            }

            console.log("Passou")
            next();

    } catch(err) {
        console.log("Parou aqui")
        res.status(500).send(err.message);
    }
}

export async function validateSignIn(req, res, next) {
    
    const user = req.body;

    const { error } = signInSchemma.validate(user, { abortEarly: false });

    if (error) {
      const errors = error.details.map((detail) => detail.message);
      return res.status(422).send({ errors });
    }

    try {
        const isUser = await connectionDB.query('SELECT * FROM users WHERE email = $1;', [user.email])

        if(isUser.rowCount === 0) { 
            return res.status(401).send("usuário incorreto") 
        }    

        const passwordIsOk = bcrypt.compareSync(user.password, isUser.rows[0].password)

        if(!passwordIsOk) {
            return res.status(409).send("Senha incorreta")
        }

        delete isUser.rows[0].password;

	    res.locals.user = isUser.rows[0];
        
        next();

    } catch(err) {
        console.log("parou aqui")
        res.status(500).send(err.message);
    }
}

export async function validateToken(req, res, next) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "")

    try {
        const isAuthorized = await connectionDB.query('SELECT * FROM sessions WHERE token = $1;',[token]);
        if(isAuthorized.rowCount === 0) {
            res.sendStatus(401)
        }

    res.locals.userId = isAuthorized.rows[0].userId;

    next()

    } catch(err) {
        res.status(500).send(err.message)
    }
}