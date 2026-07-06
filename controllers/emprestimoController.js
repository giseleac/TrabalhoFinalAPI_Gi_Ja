const emprestimoModel = require("../models/emprestimoModel");

async function listar(req, res) {

    try {

        const emprestimos = await emprestimoModel.listar();

        res.json(emprestimos);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function buscarPorId(req, res) {

    try {

        const id = req.params.id;

        const emprestimo = await emprestimoModel.buscarPorId(id);

        if (!emprestimo) {

            return res.status(404).json({
                mensagem: "Empréstimo não encontrado."
            });

        }

        res.json(emprestimo);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}

async function cadastrar(req, res) {

    try {

        const id = await emprestimoModel.cadastrar(req.body);

        res.status(201).json({
            mensagem: "Empréstimo cadastrado com sucesso.",
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

        const atualizou = await emprestimoModel.atualizar(id, req.body);

        if (!atualizou) {

            return res.status(404).json({
                mensagem: "Empréstimo não encontrado."
            });

        }

        res.json({
            mensagem: "Empréstimo atualizado com sucesso."
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

        const excluiu = await emprestimoModel.excluir(id);

        if (!excluiu) {

            return res.status(404).json({
                mensagem: "Empréstimo não encontrado."
            });

        }

        res.json({
            mensagem: "Empréstimo excluído com sucesso."
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