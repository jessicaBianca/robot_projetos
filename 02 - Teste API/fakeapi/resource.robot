*** Settings ***
Documentation    Resource para testar Fake API
Library    Collections
Library    RequestsLibrary


*** Variables ***
${URL}    https://fakerestapi.azurewebsites.net/api/v1
&{LIVRO}    id=15    title=Book 15
&{NOVO_LIVRO}    id=230    title=teste
&{LIVRO_ALTERADO}    id=230    title=alterado com PUT    description=alterado com sucesso


*** Keywords ***
Conecta API
    Create Session    fakeapi    ${URL}

Acessar /books e pesquisar por todos os livros
    ${res}    Get Request    fakeapi    /Books
    Log    ${res.text}
    Log    ${res.content}
    Set Test Variable    ${res}
   
Verificar status code "${status_esperado}"
    Should Be Equal As Strings    ${res.status_code}    ${status_esperado}

Verificar reason "${reason_esperado}"
    Should Be Equal As Strings    ${res.reason}    ${reason_esperado}

Verificar que retorna o total de "${qtd}" livros
    Length Should Be    ${res.json()}    ${qtd}
Acessar /books e pesquisar pelo livro "${id_livro}"
    ${res}    Get Request    fakeapi    /Books/${id_livro}
    Log    ${res.text}
    Set Test Variable    ${res}
Verificar ID
    Dictionary Should Contain Item    ${res.json()}    id    ${LIVRO.id}

Verificar title
    Dictionary Should Contain Item    ${res.json()}    title    ${LIVRO.title}

Cadastro um novo livro
     ${headers}    Create Dictionary    content-type=application/json
     ${res}    Post Request    fakeapi    /Books
     ...       data={"id": 230,"title": "teste","description": "teste","pageCount": 2,"excerpt": "teste","publishDate": "2022-11-17T01:31:09.244Z"}    
     ...       headers=${headers}
     Log    ${res.text}
     Set Test Variable    ${res}

Conferir o ID do novo livro
    Dictionary Should Contain Item    ${res.json()}    id    ${NOVO_LIVRO.id}

Conferir o title do novo livro
     Dictionary Should Contain Item    ${res.json()}    title    ${NOVO_LIVRO.title}

Alterar o livro "${id_livro}"
    ${headers}    Create Dictionary    content-type=application/json
    ${res}    Put Request    fakeapi    /Books/${id_livro}
    ...       data={"id": 230,"title": "alterado com PUT","description": "alterado com sucesso","pageCount": 2,"excerpt": "teste","publishDate": "2022-11-17T01:31:09.244Z"}
    ...       headers=${headers}
    Log    ${res.text}
    Set Test Variable    ${res}


Conferir o title alterado via PUT
    Dictionary Should Contain Item    ${res.json()}    title    ${LIVRO_ALTERADO.title}

Conferir o description alterado via PUT
    Dictionary Should Contain Item    ${res.json()}    description    ${LIVRO_ALTERADO.description}

Deletar o livro "${id_livro}"  
    ${res}    Delete Request    fakeapi    /Books/${id_livro}
    Set Test Variable    ${res}

Verificar o content
    Should Be Empty    ${res.content}

    

    