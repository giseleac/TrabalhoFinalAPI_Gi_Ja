const conn = require("../config/database");

async function listar() {

    return await conn("usuarios");

}

async function buscarPorId(id) {

    return await conn("usuarios")
        .where("id_usuario", id)
        .first();

}

async function cadastrar(dados) {

    return await conn("usuarios")
        .insert(dados);

}

async function atualizar(id, dados) {

    return await conn("usuarios")
        .where("id_usuario", id)
        .update(dados);

}

async function excluir(id) {

    return await conn("usuarios")
        .where("id_usuario", id)
        .delete();

}

module.exports = {
    listar,
    buscarPorId,
    cadastrar,
    atualizar,
    excluir
};