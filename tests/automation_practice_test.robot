*** Settings ***
Documentation       This suite tests the Automation Practice website

Library             SeleniumLibrary
Library             FakerLibrary
Resource            ../config/config.resource
Resource            ../resources/automation_practice_resource.resource
Test Setup          Open Browser        ${URL}          ${BROWSER}
Test Teardown       Close Browser

*** Test Cases ***
Test case 01 - Purchase a product
    [Documentation]     This test verifies by performing successful validation at the end and
    ...                 using Faker to generate registration data
    
    ${GENERATE_EMAIL_FAKER}             FakerLibrary.Email
    ${FIRST_NAME_FAKER}                 FakerLibrary.FirstName
    ${LAST_NAME_FAKER}                  FakerLibrary.LastName
    ${PASSWORD_FAKER}                   FakerLibrary.Password
    ${ADDRESS_FAKER}                    FakerLibrary.Address
    ${CITY_FAKER}                       FakerLibrary.City
    ${POSTAL_FAKER}                     FakerLibrary.Postalcode
    ${GENERATE_EMAIL_REFERENCE_FAKER}   FakerLibrary.Email

    Maximize Browser Window
    
    check the page title is "My Store"
    fill the field "Blouse"
    click button magnifying glass
    select a product, add cart and proceed to checkout
    create email and fill in register   ${GENERATE_EMAIL_FAKER}  ${FIRST_NAME_FAKER}  ${LAST_NAME_FAKER}  ${PASSWORD_FAKER}
    ...                                 ${ADDRESS_FAKER}  ${CITY_FAKER}  ${POSTAL_FAKER}  ${GENERATE_EMAIL_REFERENCE_FAKER}
    addresses, click box terms of service and proceed to checkout
    payment method and confirm payment