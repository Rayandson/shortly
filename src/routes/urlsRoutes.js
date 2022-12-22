import { Router } from "express";
import { create, findById, redirect, remove } from "../controllers/urlsController.js";
import { validateToken } from "../middlewares/authMiddlewares.js";
import { validateUrlsSchema, validateShortUrl, deletePermission } from "../middlewares/urlsMiddlewares.js";

const router = Router()

router.post("/urls/shorten", validateToken, validateUrlsSchema, create);
router.get("/urls/:id", findById);
router.get("/urls/open/:shortUrl", validateShortUrl, redirect);
router.delete("/urls/:id", validateToken, deletePermission, remove);

export default router;