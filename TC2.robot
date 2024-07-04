*** Settings ***
Library                     SeleniumLibrary
Suite Setup         Navigate to site
Suite Teardown      Close All Browsers


*** Variables ***
${EMAIL}    testuserfortesting14@mail.com
${PASSWORD}    123456


*** Test Cases ***
AddToWishlistTest
    Click Element    css=.nav.float-end .dropdown
    Click Link    css=a[href*="login"]
    Set values in form    ${EMAIL}    ${PASSWORD}
    Click Button    css=[type="submit"]
    Sleep    3s    # Pauses for 5 seconds
    Page Should Contain Element  xpath=//h2[contains(text(),'My Account')]
    Click Element   css=i[class*="home"]
    Click Element   css=li[class="nav-item dropdown"]:nth-child(2)
    Click Element   css=div[class="dropdown-menu show"] a[class="see-all"]
    Scroll Element Into View  css=div.col:nth-child(2) button[type="submit"]:nth-child(2)
    Click Element   css=div.col:nth-child(2) button[type="submit"]:nth-child(2)
    Page Should Contain Element   css=#alert


*** Keywords ***
Navigate to site
    Open Browser    https://demo.opencart.com/              Chrome    executable_path=./chromedriver.exe


Set values in form
    [Arguments]             ${EMAIL}        ${PASSWORD}
    Input Text    css=input[name="email"]    ${EMAIL}
    Input Text    css=input[name="password"]    ${PASSWORD}