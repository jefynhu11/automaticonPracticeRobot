*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
check the page title is "${TITULO}"
    Title Should Be         title=${TITULO}

fill the field "${TEXTO}"
    Input Text              id=search_query_top             ${TEXTO}

click button magnifying glass
    Click Element           name=submit_search