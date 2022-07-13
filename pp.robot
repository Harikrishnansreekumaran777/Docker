*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}            http://the-internet.herokuapp.com/login


*** Keywords ***
Open Website
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Open Browser    ${URl}    chrome    options=${chrome_options}      

*** Settings ***
Suite Setup       Open Website

***Test Cases***
Heroku Login chrome headless
    Open Website
    Input Text  //input[@id='username']  tomsmith
    Input Text  //input[@id='password']  SuperSecretPassword!
    Click Button  Login
    Element Text Should be  //h4  Welcome to the Secure Area. When you are done click logout below.  Expected message is not shown
    Capture Page Screenshot
    Click Link  Logout
    Capture Page Screenshot
    
 