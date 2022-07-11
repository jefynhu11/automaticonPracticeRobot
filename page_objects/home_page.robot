*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
acheck the page title is "${TITULO}"
    Title Should Be         title=${TITULO}

afill the field "${TEXTO}"
    Input Text              id=search_query_top             ${TEXTO}

aclick button magnifying glass
    Click Element           name=submit_search