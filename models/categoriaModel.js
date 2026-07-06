const conn = require("../config/database");

async function listar() {

    return await conn("categorias");

}

async function buscarPorId(id) {

    return await conn("categorias")
        .where("id_categoria", id)
        .first();

}

async function cadastrar(dados) {

    return await conn("categorias")
        .insert(dados);

}

async function atualizar(id, dados) {

    return await conn("categorias")
        .where("id_categoria", id)
        .update(dados);

}

async function excluir(id) {

    return await conn("categorias")
        .where("id_categoria", id)
        .delete();

}

module.exports = {
    listar,
    buscarPorId,
    cadastrar,
    atualizar,
    excluir
};