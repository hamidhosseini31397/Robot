*** Settings ***
Documentation       robot projekt på git
Library     SeleniumLibrary
Suite Setup     setup

*** Variables ***
${useremial}          hamid@gamil.se
${passwrod}          123
${url}               https://automationplayground.com/crm/

${New Customer}      id:new-customer
${Emial }           //*[@id="EmailAddress"]
${First Name }      //input[@id='FirstName']
${Last Name }       //input[@id='LastName']
${City }            //input[@id='City']



*** Test Cases ***
BDD test
    when User are in sign in page
    and Is logged in
    then Create new customer
    and Verify that the customer has been successfully created


*** Keywords ***

setup
    Open Browser        browser=Chrome
    Go To   ${url}
    Wait Until Element Is Visible    //a[@class='navbar-brand col-sm-3 col-md-2 mr-0']


when User are in sign in page
    [Documentation]     navigate to sign in page
    [Tags]      login
    Click Link    //a[@id='SignIn']

and Is logged in
    [Documentation]                 Enter your information
    [Tags]                          login
    Input Text                      //*[@id="email-id"]   ${useremial}
    Input Password                  //*[@id="password"]   ${passwrod}
    Click Button                    //button[@id='submit-id']
    Wait Until Element Is Visible   //*[@id="new-customer"]

then Create new customer
    [Tags]      cusomer
    Click Link      ${New Customer}
    Input Text      ${Emial }           ${useremial}
    Input Text      ${First Name }      Hamid
    Input Text      ${Last Name }       Hosseini
    Input Text      ${City }            London
    Select From List By Index    //select[@id='StateOrRegion']      1
    Click Element       name:gender
    Click Element    name:promos-name
    Click Button        //*[@id="loginform"]/div/div/div/div/form/button

and Verify that the customer has been successfully created
    Wait Until Element Is Visible    //div[@id='Success']
    Element Text Should Be    //h2[normalize-space()='Our Happy Customers']    Our Happy Customers



