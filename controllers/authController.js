const usuarioModel = require("../models/usuarioModel");

const bcrypt = require("bcrypt");

const jwt = require("jsonwebtoken");

const SECRET = "biblioteca_gija_2026";



async function login(req, res) {

    try {

        const { email, senha } = req.body;

        const usuario = await usuarioModel.buscarPorEmail(email);

        if (!usuario) {

            return res.status(401).json({
                mensagem: "E-mail ou senha inválidos."
            });

        }

        const senhaValida = await bcrypt.compare(senha, usuario.senha);

        if (!senhaValida) {

            return res.status(401).json({
                mensagem: "E-mail ou senha inválidos."
            });

        }

        const token = jwt.sign(
            {
                id: usuario.id_usuario,
                nome: usuario.nome,
                email: usuario.email
            },
            SECRET,
            {
                expiresIn: "1h"
            }
        );

        res.json({
            mensagem: "Login realizado com sucesso.",
            token
        });

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

module.exports = {
    login
};
