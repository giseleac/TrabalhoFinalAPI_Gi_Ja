const form = document.getElementById("loginForm");

if (form) {

    form.addEventListener("submit", async function (e) {

        e.preventDefault();

        const email = document.getElementById("email").value;
        const senha = document.getElementById("senha").value;
        const mensagem = document.getElementById("mensagem");

        try {

            const resposta = await fetch("/api/login", {

                method: "POST",

                headers: {
                    "Content-Type": "application/json"
                },

                body: JSON.stringify({
                    email,
                    senha
                })

            });

            const dados = await resposta.json();

            if (!resposta.ok) {

                mensagem.innerText = dados.mensagem || dados.erro;

                return;

            }

            localStorage.setItem("token", dados.token);

            mensagem.innerText = "Login realizado com sucesso!";

            window.location.href = "/dashboard";

        } catch (erro) {

            mensagem.innerText = "Erro ao conectar com o servidor.";

        }

    });

}

const googleLogin = document.getElementById("googleLogin");

if (googleLogin) {

    googleLogin.addEventListener("click", function () {

        window.location.href = "/api/auth/google";

    });

}

const logout = document.getElementById("logout");

if (logout) {

    logout.addEventListener("click", function () {

        localStorage.removeItem("token");

        window.location.href = "/";

    });

}