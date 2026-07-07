const express = require("express");

const router = express.Router();

const livroController = require("../controllers/livroController");
const verificarToken = require("../middlewares/auth");

router.get("/", verificarToken, livroController.listar);

router.get("/:id", verificarToken, livroController.buscarPorId);

router.post("/", verificarToken, livroController.cadastrar);

router.put("/:id", verificarToken, livroController.atualizar);

router.delete("/:id", verificarToken, livroController.excluir);

module.exports = router;