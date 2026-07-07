require("dotenv").config();

const session = require("express-session");
const passport = require("passport");
require("./config/passport");

const express = require("express");
const path = require("path");

const app = express();

const PORT = 8001;

app.use(express.json());

app.use(
    session({
        secret: process.env.JWT_SECRET,
        resave: false,
        saveUninitialized: false
    })
);

app.use(passport.initialize());

app.use(passport.session());

app.use(express.static(path.join(__dirname, "public")));

const livroRoutes = require("./routes/livroRoutes");
const categoriaRoutes = require("./routes/categoriaRoutes");
const usuarioRoutes = require("./routes/usuarioRoutes");
const emprestimoRoutes = require("./routes/emprestimoRoutes");
const authRoutes = require("./routes/authRoutes");

app.use("/api/livros", livroRoutes);
app.use("/api/categorias", categoriaRoutes);
app.use("/api/usuarios", usuarioRoutes);
app.use("/api/emprestimos", emprestimoRoutes);
app.use("/api", authRoutes);

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "index.html"));
});

app.get("/dashboard", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "dashboard.html"));
});

app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});