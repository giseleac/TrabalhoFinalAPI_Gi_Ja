const livroModel = require("../models/livroModel");


async function listar(req, res) {

    try {

        const livros = await livroModel.listar();

        res.json(livros);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}


async function buscarPorId(req, res) {

    try {

        const id = req.params.id;

        const livro = await livroModel.buscarPorId(id);

        if (!livro) {
            return res.status(404).json({
                mensagem: "Livro não encontrado."
            });
        }

        res.json(livro);

    } catch (erro) {

        res.status(500).json({
            erro: erro.message
        });

    }

}


async function cadastrar(req, res) {

    try {

        const id = await livroModel.cadastrar(req.body);

        res.status(201).json({
            mensagem: "Livro cadastrado com sucesso.",
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

        const atualizou = await livroModel.atualizar(id, req.body);

        if (!atualizou) {

            return res.status(404).json({
                mensagem: "Livro não encontrado."
            });

        }

        res.json({
            mensagem: "Livro atualizado com sucesso."
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

        const excluiu = await livroModel.excluir(id);

        if (!excluiu) {

            return res.status(404).json({
                mensagem: "Livro não encontrado."
            });

        }

        res.json({
            mensagem: "Livro excluído com sucesso."
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
}
