const jwt = require("jsonwebtoken");

const SECRET = "biblioteca_gija_2026";

function verificarToken(req, res, next) {

    const authHeader = req.headers.authorization;

    if (!authHeader) {

        return res.status(401).json({
            mensagem: "Token não informado."
        });

    }

    const token = authHeader.split(" ")[1];

    try {

        const dados = jwt.verify(token, SECRET);

        req.usuario = dados;

        next();

    } catch (erro) {

        return res.status(401).json({
            mensagem: "Token inválido."
        });

    }

}

module.exports = verificarToken;