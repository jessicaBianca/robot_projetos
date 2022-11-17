*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/       
${BTN_ADD_CARRINHO}        //input[contains(@name,'submit.add-to-cart')]
${BTN_CARRINHO}            //span[@aria-hidden='true'][contains(.,'Carrinho')]
${BTN_EXCLUIR}             //input[contains(@value,'Excluir')]

*** Keywords ***
Abrir Navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar Navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    ${URL}
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Wait Until Element Is Visible    twotabsearchtextbox
    Input Text    twotabsearchtextbox    ${PRODUTO}
Clicar no botão de pesquisa
    Click Element    nav-search-submit-button
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Page Contains    ${PRODUTO}
    Page Should Contain    ${PRODUTO}
Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    add-to-cart-button
    Click Element    ${BTN_ADD_CARRINHO}
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains    Adicionado ao carrinho
    Page Should Contain    Adicionado ao carrinho

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    ${BTN_CARRINHO}
    Click Element    ${BTN_EXCLUIR}
Verificar se o carrinho fica vazio
    Wait Until Page Contains    Seu carrinho de compras da Amazon está vazio.
    Page Should Contain    Seu carrinho de compras da Amazon está vazio.

### GHERKIN BDD ###

Dado que acesso o site Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando digito "Xbox Series S" no campo de pesquisa
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
E clico no botão de pesquisa
    Clicar no botão de pesquisa
E verifico se está listando o produto "Console Xbox Series S"
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
E adiciono o produto "Console Xbox Series S" no carrinho
    Adicionar o produto "${PRODUTO}" no carrinho
E verifico se o produto "Console Xbox Series S" foi adicionado com sucesso
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
Então removo o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho
E verifico se o carrinho fica vazio
    Verificar se o carrinho fica vazio