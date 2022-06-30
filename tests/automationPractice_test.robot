*** Settings ***
Documentation       This suite tests the Automation Practice website
Resource            ../resources/automationPractice_resource.robot
Test Setup          open to browser
Test Teardown       close to browser

*** Test Cases ***
Caso de Teste 01 - Purchase a product
    [Documentation]     This test verifies by performing successful validation at the end and
    ...                 using Faker to generate registration data
    
    access website Automation Practice
    check the page title is "My Store"
    fill the field "Blouse"
    click button magnifying glass
    select a product
    add cart
    proceed to checkout
    summary proceed to checkout
    create email
    fill in register