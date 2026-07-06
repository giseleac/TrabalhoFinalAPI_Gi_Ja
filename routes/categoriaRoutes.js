const express = require("express");

const router = express.Router();

const categoriaController = require("../controllers/categoriaController");
const verificarToken = require("../middlewares/auth");

router.get("/", verificarToken, categoriaController.listar);

router.get("/:id", verificarToken, categoriaController.buscarPorId);

router.post("/", verificarToken, categoriaController.cadastrar);

router.put("/:id", verificarToken, categoriaController.atualizar);

router.delete("/:id", verificarToken, categoriaController.excluir);

module.exports = router;