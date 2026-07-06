const usuarioModel = require("../models/usuarioModel");

async function listar(req, res) {

    try {

        const usuarios = await usuarioModel.listar();

        res.json(usuarios);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function buscarPorId(req, res) {

    try {

        const id = req.params.id;

        const usuario = await usuarioModel.buscarPorId(id);

        if (!usuario) {

            return res.status(404).json({
                mensagem: "Usuário não encontrado."
            });

        }

        res.json(usuario);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function cadastrar(req, res) {

    try {

        const id = await usuarioModel.cadastrar(req.body);

        res.status(201).json({
            mensagem: "Usuário cadastrado com sucesso.",
            id: id[0]
        });

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function atualizar(req, res) {

    try {

        const id = req.params.id;

        const atualizou = await usuarioModel.atualizar(id, req.body);

        if (!atualizou) {

            return res.status(404).json({
                mensagem: "Usuário não encontrado."
            });

        }

        res.json({
            mensagem: "Usuário atualizado com sucesso."
        });

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function excluir(req, res) {

    try {

        const id = req.params.id;

        const excluiu = await usuarioModel.excluir(id);

        if (!excluiu) {

            return res.status(404).json({
                mensagem: "Usuário não encontrado."
            });

        }

        res.json({
            mensagem: "Usuário excluído com sucesso."
        });

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

module.exports = {
    listar,
    buscarPorId,
    cadastrar,
    atualizar,
    excluir
};