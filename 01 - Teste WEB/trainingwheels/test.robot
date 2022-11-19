*** Settings ***
Documentation        Testes aplicados no site Training Wheels
Test Setup           Abrir navegador
Test Teardown        Fechar navegador
Resource             resource.robot

*** Test Cases ***
Caso 01 - Acessar o site e validar o título do site 
    Acessar home page 
    Validar o título da página "Training Wheels Protocol"
Caso 02 - Manipular os checkbox da página 
    Acessar a página "/checkboxes"
    Marcar a opção Homem de Ferro
Caso 03 - Manipular o radio button
    Acessar a página "/radios"
    Selecionar a opção "thor"
Caso 04 - Manipular dropdown list (por texto)
    Acessar a página "/dropdown"
    Selecionar na lista a opção Natasha Romanoff por texto
Caso 05 - Manipular dropdown list (por value)
    Acessar a página "/dropdown"
    Selecionar na lista a opção Steve Rogers por value
Caso 06 - Manipulando valores em tabela 
    Acessar a página "/tables"
    Verificar valor ao selecionar a linha 
    Descobre linha pelo texto chave e valida as informações 
Caso 07 - Efetuar login com sucesso e validar mensagem de boas vindas
    Acessar a página "/login"
    Digitar login
    Digitar senha
    Clicar no botão Login
    Validar mensagem de boas vindas
Caso 08 - Efetuar login com senha inválida
    Acessar a página "/login"
    Digitar login
    Digitar senha inválida
    Clicar no botão Login
    Validar mensagem de senha inválida