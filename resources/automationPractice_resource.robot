*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${BROWSER}                  chrome
${URL}                      http://automationpractice.com/index.php

*** Keywords ***
open browser
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

close browser
    Close Browser

access website Automation Practice
    Go To                   url=${URL}

check the page title is "${TITULO}"
    Title Should Be         title=${TITULO}

fill the field "${TEXTO}"
    Input Text              id=search_query_top             ${TEXTO}

click button magnifying glass
    Click Element           name=submit_search

select a product
    Click Element           css=#center_column > ul > li > div > div.left-block > div > a.product_img_link > img

add cart
    Click Element           name=Submit

proceed to checkout
    Sleep   5
    Wait Until Element Is Visible       css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a
    Click Element                       css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a

summary proceed to checkout
    Click Element                       css=#center_column > p.cart_navigation.clearfix > a.button.btn.btn-default.standard-checkout.button-medium

create email
    ${GERAR_EMAIL}                      FakerLibrary.Email
    Input Text                          id=email_create                     ${GERAR_EMAIL}
    Click Element                       id=SubmitCreate

fill in register
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