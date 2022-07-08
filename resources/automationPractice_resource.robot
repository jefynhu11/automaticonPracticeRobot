*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${BROWSER}                  firefox
${URL}                      http://automationpractice.com/index.php

*** Keywords ***
open to browser
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

close to browser
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
    Wait Until Element Is Visible       css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a
    Click Element                       css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a

summary proceed to checkout
    Click Element                       css=#center_column > p.cart_navigation.clearfix > a.button.btn.btn-default.standard-checkout.button-medium

create email
    ${GERAR_EMAIL}                      FakerLibrary.Email
    Input Text                          id=email_create                     ${GERAR_EMAIL}
    Click Element                       id=SubmitCreate

fill in register
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
    Input Text                          id=phone_mobile                     99999
    ${GERAR_EMAIL_REFERENCE}            FakerLibrary.Email
    Input Text                          id=alias                            ${GERAR_EMAIL_REFERENCE}
    Click Element                       id=submitAccount

addresses and proceed to checkout
    Click Element                       name=processAddress

click box terms of service and proceed to checkout
    Click Element                       id=cgv
    Click Element                       name=processCarrier

payment method
    Click Element                       css=.payment_module .bankwire

confirm payment
    Click Element                       css=#cart_navigation .button