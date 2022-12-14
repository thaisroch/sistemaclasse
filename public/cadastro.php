<?php

require_once '..' . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'models' . DIRECTORY_SEPARATOR . 'Professor.php';
$professor = new Professor;

include 'header-login.php';
?>
<main>
    <aside>
        <picture>
            <source media="(max-width: 670px)" srcset="imagem/backgroud-300.jpg">
            <img src="imagem/backgroud-600.jpg" alt="Tela de fundo!">
        </picture>
    </aside>
    <article class="conteiner">
        <h1>Crie sua conta</h1>
        <form method="POST">
            <input type="text" name="nome" placeholder="Nome completo" maxlenght="30">
            <input type="email" name="email" placeholder="E-mail" maxlength="40">
            <input type="password" name="senha" placeholder="Senha" maxlength="15">
            <input type="password" name="confSenha" placeholder="Confirmar a senha" maxlength="15">
            <button type="submit" class="btn">Cadastrar</button>
            <a href="index.php" class="btn-linkado">Voltar</a>
        </form>
        <?php
        if (isset($_POST['nome'])) {
            $nome = addslashes($_POST['nome']);
            $email = addslashes($_POST['email']);
            $senha = addslashes($_POST['senha']);
            $confirmarSenha = addslashes($_POST['confSenha']);
            if (!empty($nome) && !empty($email) && !empty($senha) && !empty($confirmarSenha)) {
                $professor->conectar("db_sistemadeclasse", "localhost", "root", "DB_sistema*classe1");
                if ($professor->msgErro == "") {
                    if ($senha == $confirmarSenha) {
                        if ($professor->cadastrar($nome, $email, $senha)) {
        ?>
                            <div id="resp-sucesso">
                                Cadastrado com sucesso!
                            </div>
                        <?php
                        } else {
                        ?>
                            <div class="resp-erro">
                                E-mail já cadastrado!
                            </div>
                        <?php
                        }
                    } else {
                        ?>
                        <div class="resp-erro">
                            Senha não correspondem
                        </div>
                    <?php
                    }
                } else {
                    ?>
                    <div class="resp-erro">
                        <?php echo `Erro` . $u->msgErro; ?>
                    </div>
                <?php
                }
            } else {
                ?>
                <div class="resp-erro">
                    Preencha todos os campos!
                </div>
        <?php
            }
        }
        ?>
    </article>
</main>
<?= include 'footer.php'; ?>