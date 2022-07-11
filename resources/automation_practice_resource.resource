*** Settings ***
Resource            ../page_objects/home_page.resource
Resource            ../page_objects/product_page.resource
Resource            ../page_objects/register_page.resource
Resource            ../page_objects/address_terms_page.resource
Resource            ../page_objects/payment_confirm_page.resource

*** Keywords ***
check the page title is "${TITULO}"
    Title Should Be         title=${TITULO}

fill the field "${TEXTO}"
    Input Text              ${FILL_SEARCH_FIELD}                ${TEXTO}

click button magnifying glass
    Click Element           ${BUTTON_MAGNIFYING_GLASS}

select a product, add cart and proceed to checkout
    Click Element                       ${SELECT_PRODUCT}
    Click Element                       ${ADD_CART}
    Wait Until Element Is Visible       ${PROCEED_TO_CHECKOUT}
    Click Element                       ${PROCEED_TO_CHECKOUT}
    Click Element                       ${SUMMARY_PROCEED}

create email and fill in register
    ${GERAR_EMAIL}                      FakerLibrary.Email
    Input Text                          ${CREATE_EMAIL}                     ${GERAR_EMAIL}
    Click Element                       ${BUTTON_CREATE_EMAIL}
    Wait Until Element Is Visible       ${TITLE_MR}
    Click Element                       ${TITLE_MR}
    ${FIRST_NAME_FAKER}                 FakerLibrary.FirstName
    Input Text                          ${FIRST_NAME}                       ${FIRST_NAME_FAKER}
    ${LAST_NAME_FAKER}                  FakerLibrary.LastName
    Input Text                          ${LAST_NAME}                        ${LAST_NAME_FAKER}
    ${PASSWORD_FAKER}                   FakerLibrary.Password
    Input Text                          ${PASSWORD}                         ${PASSWORD_FAKER}
    Select From List By Value           ${SELECT_DAY}                       3
    Select From List By Value           ${SELECT_MONTH}                     11
    Select From List By Value           ${SELECT_YEAR}                      1992
    ${ADDRESS_FAKER}                    FakerLibrary.Address
    Input Text                          ${ADDRESS1}                         ${ADDRESS_FAKER}
    ${CITY_FAKER}                       FakerLibrary.City
    Input Text                          ${CITY}                             ${CITY_FAKER} 
    Select From List By Value           ${SELECT_STATE}                     2
    ${POSTAL_FAKER}                     FakerLibrary.Postalcode
    Input Text                          ${POSTAL}                           ${POSTAL_FAKER}
    Input Text                          ${PHONE_MOBILE}                     99999
    ${GERAR_EMAIL_REFERENCE_FAKER}      FakerLibrary.Email
    Input Text                          ${EMAIL_REFERENCE}                  ${GERAR_EMAIL_REFERENCE_FAKER}
    Click Element                       ${BUTTON_SUBMIT_ACCOUNT}

addresses, click box terms of service and proceed to checkout
    Click Element                       ${BUTTON_ADDRESS}
    Click Element                       ${CLICK_BOX}
    Click Element                       ${BUTTON_PROCESS_CARRIER}

payment method and confirm payment
    Click Element                       ${PAYMENT_BANKWIRE}
    Click Element                       ${CONFIRM_PAYMENT}