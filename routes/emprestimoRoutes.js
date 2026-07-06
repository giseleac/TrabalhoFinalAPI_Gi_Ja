const express = require("express");

const router = express.Router();

const emprestimoController = require("../controllers/emprestimoController");

router.get("/", emprestimoController.listar);

router.get("/:id", emprestimoController.buscarPorId);

router.post("/", emprestimoController.cadastrar);

router.put("/:id", emprestimoController.atualizar);

router.delete("/:id", emprestimoController.excluir);

module.exports = router;