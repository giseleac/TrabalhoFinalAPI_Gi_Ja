const conn = require("../config/database");

async function listar() {

    return await conn("emprestimos");

}

async function buscarPorId(id) {

    return await conn("emprestimos")
        .where("id_emprestimo", id)
        .first();

}

async function cadastrar(dados) {

    return await conn("emprestimos")
        .insert(dados);

}

async function atualizar(id, dados) {

    return await conn("emprestimos")
        .where("id_emprestimo", id)
        .update(dados);

}

async function excluir(id) {

    return await conn("emprestimos")
        .where("id_emprestimo", id)
        .delete();

}

module.exports = {
    listar,
    buscarPorId,
    cadastrar,
    atualizar,
    excluir
};