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
    
    Maximize Browser Window
    
    check the page title is "My Store"
    fill the field "Blouse"
    click button magnifying glass
    select a product, add cart and proceed to checkout
    create email and fill in register
    addresses, click box terms of service and proceed to checkout
    payment method and confirm payment