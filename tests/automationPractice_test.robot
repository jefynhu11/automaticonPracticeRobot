*** Settings ***
Documentation       This suite tests the Automation Practice website
Resource            resources/automationPractice_resource.robot
Test Setup          open browser
Test Teardown       close browser

*** Test Cases ***
Caso de Teste 01 - Purchase a product
    [Documentation]     This test verifies by performing successful validation at the end and
    ...                 using Faker to generate registration data
    
    access website Automation Practice
    Verificar se o título da página fica "My Store"
    check the page title is "My Store"
    fill the field "Blouse"
    click button magnifying glass
    select a product
    add cart
    proceed to checkout
    summary proceed to checkout
    create email
    fill in register
    Sleep   5