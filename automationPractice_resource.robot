*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${BROWSER}                  chrome
${URL}                      http://automationpractice.com/index.php

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fecha o navegador
    Close Browser

Acessa do site Automation Practice
    Go To                   url=${URL}

Verificar se o título da página fica "${TITULO}"
    Title Should Be         title=${TITULO}

Preenche pesquisa no campo "${TEXTO}"
    Input Text              id=search_query_top             ${TEXTO}

Clica botão lupa
    Click Element           name=submit_search

Seleciona um produto
    Click Element           css=#center_column > ul > li > div > div.left-block > div > a.product_img_link > img

Adiciona carrinho
    Click Element           name=Submit

Proceed to checkout
    Sleep   5
    Wait Until Element Is Visible       css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a
    Click Element                       css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a

Summary Proceed to checkout
    Click Element                       css=#center_column > p.cart_navigation.clearfix > a.button.btn.btn-default.standard-checkout.button-medium

Criar email
    ${GERAR_EMAIL}                      FakerLibrary.Email
    Input Text                          id=email_create                     ${GERAR_EMAIL}
    Click Element                       id=SubmitCreate

Preenche cadastrar
    Sleep   5
    Wait Until Element Is Visible       id=id_gender1
    Click Element                       id=id_gender1
    ${FIRST_NAME}                       FakerLibrary.FirstName
    Input Text                          id=customer_firstname               ${FIRST_NAME}
    ${LAST_NAME}                        FakerLibrary.LastName
    Input Text                          id=customer_lastname                ${LAST_NAME}
    ${PASSWORD}                         FakerLibrary.Password
    Input Text                          id=passwd                           ${PASSWORD}
    Select From List By Value           id=days                             3
    Select From List By Value           id=months                           11
    Select From List By Value           id=years                            1992
    ${ADDRESS}                          FakerLibrary.Address
    Input Text                          id=address1                         ${ADDRESS}
    ${CITY}                             FakerLibrary.City
    Input Text                          id=city                             ${CITY} 
    Select From List By Value           id=id_state                         2
    ${POSTAL}                           FakerLibrary.Postalcode
    Input Text                          id=postcode                         ${POSTAL}
    ${PHONE_MOBILE}                     FakerLibrary.Phone Number
    Input Text                          id=phone_mobile                     ${PHONE_MOBILE}
    ${GERAR_EMAIL_REFERENCE}            FakerLibrary.Email
    Input Text                          id=alias                            ${GERAR_EMAIL_REFERENCE}
    Click Element                       id=submitAccount