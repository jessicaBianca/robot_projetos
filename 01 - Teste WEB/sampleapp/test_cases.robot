*** Settings ***
Documentation        Testes aplicados no site da sampleapp.tricentis.com no menu Automobile
Resource             resource.robot
Test Setup           Abrir browser
Test Teardown        Fechar browser

*** Test Cases ***
Caso de teste 01 - Acessando o site da sampleapp
    [Tags]    enter_sample_app
    Dado que acesso a homepage do sampleapp
    Então valido que o título da página é "Tricentis Vehicle Insurance"

Caso de teste 02 - Acessando o menu Automobile e preenchendo o Enter Vehicle Data
    [Tags]    enter_vehicle_data
    Dado que acesso a homepage do sampleapp
    Quando clico no menu Automobile
    Quando preencho todos os campos obrigatórios da Enter Vehicle Data
    Então ao clicar em Next devo ser direcionado para Enter Insurant Data
     
Caso de teste 03 - Preenchimento do Enter Insurant Data
    [Tags]    enter_insurant_data
    Dado que acesso a homepage do sampleapp
    Quando clico no menu Automobile     
    Dado que estou no submenu Enter Insurant Data
    Quando preencho todos os campos obrigatórios da Enter Insurant Data
    Então ao clicar em Next devo ser direcionado para a próxima página

Caso de teste 04 - Preenchimento do Enter Product Data
    [Tags]    enter_product_data
    Dado que acesso a homepage do sampleapp
    Quando clico no menu Automobile
    E acesso o submenu Enter Product Data
    Quando preencho todos os campos obrigatórios da Enter Product Data
    Então ao clicar em Next devo ser direcionado para a página de Price Option

    
Caso de teste 05 - Preenchimento do Select Price Option
    [Tags]    select_price_option
    Dado que acesso a homepage do sampleapp
    Quando clico no menu Automobile
    Quando preencho todos os campos obrigatórios da Enter Vehicle Data
    Então ao clicar em Next devo ser direcionado para Enter Insurant Data
    Quando preencho todos os campos obrigatórios da Enter Insurant Data
    Então ao clicar em Next devo ser direcionado para a próxima página
    Quando preencho todos os campos obrigatórios da Enter Product Data
    Então ao clicar em Next devo ser direcionado para a página de Price Option
    Quando preencho todos os campos obrigatórios da Select Price Option
    Então ao clicar em Next devo ser direcionado para o submenu Send Quote
    Quando preencho todos os campos obrigatórios da Send Quote    
    Então ao clicar send devo enviar o email
    Confirmar caixa de email enviado