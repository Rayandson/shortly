import { Router } from "express";
import { signIn, signUp } from "../controllers/authController.js";
import { validateSignIn, validateSignUp } from "../middlewares/authMiddlewares.js";

const router = Router()

router.post("/signup", validateSignUp, signUp);
router.post("/signin", validateSignIn, signIn);

export default router;