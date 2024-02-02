*** Settings ***
Documentation       Robot projekt på Git - Login Functionality
Library     SeleniumLibrary
Suite Setup     Open Browser    browser=Chrome    url=https://automationplayground.com/crm/
Suite Teardown    Close Browser

*** Variables ***
${username}     hamid@gamil.se
${password}     hamid@gamil.se

*** Test Cases ***
Navigate to Sign In Page
    [Tags]      navigate
    Given the user is on the Sign In page
    When the user clicks on the Sign In link
    Then the user should be navigated to the Sign In page

Provide Username and Password
    [Tags]      login
    Given the user is on the Sign In page
    When the user enters their username and password
    And clicks the Submit button
    Then the user should be logged in
    And the New Customer element should be visible













*** Keywords ***
Given the user is on the Sign In page
    Wait Until Element Is Visible    //a[@class='navbar-brand col-sm-3 col-md-2 mr-0']

When the user clicks on the Sign In link
    Click Link    //a[@id='SignIn']

Then the user should be navigated to the Sign In page
    Wait Until Element Is Visible    //input[@placeholder='Search']    timeout=10s

When the user enters their username and password
    Input Text    //*[@id="email-id"]   ${username}
    Input Password    //*[@id="password"]   ${password}

And clicks the Submit button
    Click Button    //button[@id='submit-id']

Then the user should be logged in
    Wait Until Element Is Visible    //*[@id="new-customer"]

And the New Customer element should be visible
    Element Should Be Visible    //*[@id="new-customer"]
