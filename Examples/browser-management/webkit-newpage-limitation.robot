*** Settings ***
Library    PuppeteerLibrary
Suite Teardown    Close Puppeteer
Test Teardown    Close All Browser        


*** Test Cases ***
Webkit new page cause exception require ignore waiting
    [Tags]    Ignore_chrome    Ignore_pwchrome    Ignore_firefox
    ${BROWSER} =    Get variable value    ${BROWSER}    webkit
    ${HEADLESS} =    Get variable value    ${HEADLESS}    ${False}
    &{options} =    create dictionary    headless=${HEADLESS}
    Open browser    https://www.w3schools.com/html/html_forms.asp    browser=${BROWSER}    options=${options}
    Wait Until Element Is Visible    css=a.w3schools-logo
    Input Text    id=fname    123
    Input Text    id=lname    123
    Click Element    xpath=(//input[@value="Submit"])[1]    ${True}
