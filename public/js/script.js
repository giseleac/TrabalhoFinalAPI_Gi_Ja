const form = document.getElementById("loginForm");

if (form) {

    form.addEventListener("submit", function(e) {

        e.preventDefault();

    
        const email = document.getElementById("email").value;
        const senha = document.getElementById("senha").value;

        if (email === "admin@email.com" && senha === "123456") {
            window.location.href = "/dashboard";
        } else {
            document.getElementById("mensagem").innerText =
                "E-mail ou senha inválidos!";
        }
    });
}


const logout = document.getElementById("logout");

if (logout) {

    logout.addEventListener("click", function() {

        window.location.href = "/";

    });

}