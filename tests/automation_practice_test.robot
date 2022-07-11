*** Settings ***
Documentation       This suite tests the Automation Practice website
Resource            ../resources/automationPractice_resource.resource
Resource            ../resources/config.resource
Resource            ../page_objects/home_page.resource
# Variables            ../page_objects/page.robot
Test Setup          browser open
Test Teardown       browser close

*** Test Cases ***
Test case 01 - Purchase a product
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
    addresses and proceed to checkout
    click box terms of service and proceed to checkout
    payment method
    confirm payment