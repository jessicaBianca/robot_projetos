*** Settings ***
Documentation    Teste em uma fake API
Resource         resource.robot
Test Setup       Conecta API

*** Test Cases ***

Caso 1 - Buscar a listagem de todos os livros (GET)
    Acessar /books e pesquisar por todos os livros
    Verificar status code "200"
    Verificar reason "OK"
    Verificar que retorna o total de "200" livros

Caso 2 - Buscar um livro específico (GET/ID)
    Acessar /books e pesquisar pelo livro "15"
    Verificar status code "200"
    Verificar reason "OK"
    Verificar ID
    Verificar title

Caso 3 - Cadastrar um novo livro (POST)
    Cadastro um novo livro
    Conferir o ID do novo livro
    Conferir o title do novo livro
    Verificar status code "200"
    Verificar reason "OK"
    
Caso 4 - Alterar os dados do novo livro (PUT/ID)
    Alterar o livro "230"
    Conferir o title alterado via PUT
    Conferir o description alterado via PUT
    Verificar status code "200"
    Verificar reason "OK"

Caso 5 - Deletar um livro (DELETE/ID)
    Deletar o livro "13"
    Verificar o content
    Verificar status code "200"
    Verificar reason "OK"
  
