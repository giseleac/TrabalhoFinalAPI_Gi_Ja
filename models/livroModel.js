const conn = require("../config/database");


async function listar() {

    return await conn("livros");

}


async function buscarPorId(id) {

    return await conn("livros")
        .where("id_livro", id)
        .first();

}


async function cadastrar(dados) {

    return await conn("livros")
        .insert(dados);

}


async function atualizar(id, dados) {

    return await conn("livros")
        .where("id_livro", id)
        .update(dados);

}


async function excluir(id) {

    return await conn("livros")
        .where("id_livro", id)
        .delete();

}

module.exports = {
    listar,
    buscarPorId,
    cadastrar,
    atualizar,
    excluir
};