const categoriaModel = require("../models/categoriaModel");

async function listar(req, res) {

    try {

        const categorias = await categoriaModel.listar();

        res.json(categorias);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function buscarPorId(req, res) {

    try {

        const id = req.params.id;

        const categoria = await categoriaModel.buscarPorId(id);

        if (!categoria) {

            return res.status(404).json({
                mensagem: "Categoria não encontrada."
            });

        }

        res.json(categoria);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function cadastrar(req, res) {

    try {

        const id = await categoriaModel.cadastrar(req.body);

        res.status(201).json({
            mensagem: "Categoria cadastrada com sucesso.",
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

        const atualizou = await categoriaModel.atualizar(id, req.body);

        if (!atualizou) {

            return res.status(404).json({
                mensagem: "Categoria não encontrada."
            });

        }

        res.json({
            mensagem: "Categoria atualizada com sucesso."
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

        const excluiu = await categoriaModel.excluir(id);

        if (!excluiu) {

            return res.status(404).json({
                mensagem: "Categoria não encontrada."
            });

        }

        res.json({
            mensagem: "Categoria excluída com sucesso."
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