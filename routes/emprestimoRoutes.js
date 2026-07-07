const express = require("express");

const router = express.Router();

const emprestimoController = require("../controllers/emprestimoController");
const verificarToken = require("../middlewares/auth");

router.get("/", verificarToken, emprestimoController.listar);

router.get("/:id", verificarToken, emprestimoController.buscarPorId);

router.post("/", verificarToken, emprestimoController.cadastrar);

router.put("/:id", verificarToken, emprestimoController.atualizar);

router.delete("/:id", verificarToken, emprestimoController.excluir);
module.exports = router;