*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://sampleapp.tricentis.com/101/index.php

*** Keywords ***
Abrir browser
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar browser
    Close Browser
Dado que acesso a homepage do sampleapp
    Go To    url=${URL}

Então valido que o título da página é "${TITLE}"
    Title Should Be    title=${TITLE}

Quando clico no menu Automobile
    Click Element    locator=nav_automobile

Quando preencho todos os campos obrigatórios da Enter Vehicle Data
    Select From List By Value    //select[contains(@name,'Make')]   Audi
    Input Text    //input[contains(@name,'[kW]')]    20
    Input Text    //input[contains(@name,'Date of Manufacture')]    11/10/2022
    Select From List By Value    //select[contains(@name,'Number of Seats')]    2
    Select From List By Value    //select[contains(@name,'Fuel Type')]    Petrol
    Input Text    //input[contains(@name,'List Price')]    500
    Input Text    //input[contains(@name,'Annual Mileage')]    100

Então ao clicar em Next devo ser direcionado para Enter Insurant Data
    Click Button    locator=nextenterinsurantdata

Então ao clicar em Next devo ser direcionado para a próxima página
    Click Button    locator=nextenterproductdata

Dado que estou no submenu Enter Insurant Data
    Click Element    locator=//a[contains(@name,'Enter Insurant Data')]

Quando preencho todos os campos obrigatórios da Enter Insurant Data
    Input Text    locator=firstname    text=Jessica
    Input Text    locator=lastname     text=Oliveira
    Input Text    locator=birthdate    text=09/24/1996
    Input Text    locator=zipcode      text=231231
    Select From List By Value    country    Algeria
    Select From List By Value    occupation    Employee
    Sleep    2
    Click Element    //*[@id="insurance-form"]/div/section[2]/div[10]/p/label[1]
    #locator=speeding

E acesso o submenu Enter Product Data
    Click Element      locator=//a[contains(@name,'Enter Product Data')]

Então ao clicar em Next devo ser direcionado para a página de Price Option
    Click Element    locator=//button[@name='Next (Select Price Option)'][contains(.,'Next »')]
Quando preencho todos os campos obrigatórios da Enter Product Data
    Input Text    locator=startdate    text=01/31/2023
    Select From List By Value    //select[contains(@name,'Insurance Sum')]       3000000
    Select From List By Value    //select[contains(@name,'Merit Rating')]        Bonus 1
    Select From List By Value    //select[contains(@name,'Damage Insurance')]    No Coverage
    Click Element    locator=//*[@id="insurance-form"]/div/section[3]/div[5]/p/label[1]/span
    Select From List By Value    courtesycar    Yes

Quando preencho todos os campos obrigatórios da Select Price Option
    Click Element    locator=//*[@id="priceTable"]/tfoot/tr/th[2]/label[1]
    Click Element    locator=//*[@id="priceTable"]/tfoot/tr/th[2]/label[1]/span
    Click Element    locator=//span[contains(@class,'ideal-radio checked')]
    Click Element    locator=(//span[contains(@class,'ideal-radio')])[3]
Então ao clicar em Next devo ser direcionado para o submenu Send Quote
    Wait Until Element Is Visible    locator=nextsendquote
    Click Button    locator=nextsendquote

Quando preencho todos os campos obrigatórios da Send Quote
    Input Text    locator=email    text=jessica.b@gmail.com
    Input Text    locator=username    text=jessica
    Input Text    locator=password   text=123Ma2
    Input Text    locator=confirmpassword    text=123Ma2

Então ao clicar send devo enviar o email
    Click Button    locator=sendemail

Confirmar caixa de email enviado
    Sleep    10
    Click Button    //button[@class='confirm'][contains(.,'OK')]

