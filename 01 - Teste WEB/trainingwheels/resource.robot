*** Settings ***
Library        SeleniumLibrary
*** Variables ***
${URL}                   https://training-wheels-protocol.herokuapp.com/
${CHECK_IRON_MAN}        //input[contains(@value,'iron-man')]
${DROPDOWN_NATASHA}      //option[@value='4'][contains(.,'Natasha Romanoff')]
*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser  

Acessar home page 
    Go To    ${URL}
Validar o título da página "${TITLE}"
    Title Should Be    ${TITLE}

Acessar a página "${PAGE}"
    Go To    ${URL}${PAGE}
    
Marcar a opção Homem de Ferro
    Select Checkbox                ${CHECK_IRON_MAN}
    Checkbox Should Be Selected    ${CHECK_IRON_MAN}

Selecionar a opção "${ID}"
    Select Radio Button    movies    ${ID}
    Radio Button Should Be Set To    movies    ${ID}

Selecionar na lista a opção Natasha Romanoff por texto
    Select From List By Label    id=dropdown    Natasha Romanoff
    ${SELECTED}    Get Selected List Label      id=dropdown
    Should Be Equal    ${SELECTED}    Natasha Romanoff     

Selecionar na lista a opção Steve Rogers por value
    Select From List By Value    id=dropdown    1
    ${SELECTED}    Get Selected List Value      id=dropdown
    Should Be Equal     ${SELECTED}    1   

Verificar valor ao selecionar a linha 
    Table Row Should Contain    id=actors    1    Robert Downey Jr	


#valores_alterando_constantemente_melhor_metodo_texto_chave
Descobre linha pelo texto chave e valida as informações    
    ${TXT_INSTAGRAM}    Get WebElement    //td[contains(.,'@robertdowneyjr')]
    #Log To Console    ${TXT_INSTAGRAM.text}
    Should Contain      ${TXT_INSTAGRAM.text}    @robertdowneyjr