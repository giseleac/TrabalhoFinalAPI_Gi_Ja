const express = require("express");

const router = express.Router();

const usuarioController = require("../controllers/usuarioController");
const verificarToken = require("../middlewares/auth");

router.get("/", verificarToken, usuarioController.listar);

router.get("/:id", verificarToken, usuarioController.buscarPorId);

router.post("/", verificarToken, usuarioController.cadastrar);

router.put("/:id", verificarToken, usuarioController.atualizar);

router.delete("/:id", verificarToken, usuarioController.excluir);

module.exports = router;