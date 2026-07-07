const express = require("express");

const router = express.Router();

const passport = require("passport");

const authController = require("../controllers/authController");

router.post("/login", authController.login);
router.get(
    "/auth/google",
    passport.authenticate("google", {
        scope: ["profile", "email"]
    })
);

router.get(
    "/auth/google/callback",
    passport.authenticate("google", {
        failureRedirect: "/"
    }),
    (req, res) => {

        res.json({
            mensagem: "Login com Google realizado com sucesso!",
            usuario: req.user
        });

    }
);

module.exports = router;