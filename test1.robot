*** Settings ***
Documentation       robot projekt på git
Library     SeleniumLibrary
Suite Setup     setup

*** Variables ***
${username}     hamid@gamil.se
${passwrod}     hamid@gamil.se
${url}      https://automationplayground.com/crm/

*** Test Cases ***

test1:navigate to sign in page
    [Documentation]     navigate to sign in page
    [Tags]      navigate
    Click Link    //a[@id='SignIn']


test2: write your username and password
    [Documentation]   write your info
    [Tags]      login
    #Set Selenium Speed    1
    #Click Button   id:email-id
    Input Text    //*[@id="email-id"]   ${username}

    #Click Element    id:password
    Input Password    //*[@id="password"]   ${passwrod}

    Click Button    //button[@id='submit-id']
    Sleep    7
    Wait Until Element Is Visible    //*[@id="new-customer"]




#test2: resternade och vaifera


*** Keywords ***

setup
    Open Browser        browser=Chrome
    Go To   ${url}
    Wait Until Element Is Visible    //a[@class='navbar-brand col-sm-3 col-md-2 mr-0']
