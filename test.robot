*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}            https://www.google.com
${CHROMEDRIVER_PATH}        /usr/local/bin/chromedriver

*** Keywords ***
Open Website
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Open Browser    ${URl}    chrome    options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}

*** Settings ***
Suite Setup       Open Website

***Test Cases***
Heroku Login chrome headless
    Open Website
 