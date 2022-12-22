import { Router } from "express";
import { findAll,  ranking } from "../controllers/usersController.js";
import { validateToken } from "../middlewares/authMiddlewares.js";

const router = Router()

router.get("/users/me", validateToken, findAll);
router.get("/ranking", ranking)

export default router;