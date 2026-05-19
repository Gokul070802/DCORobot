*** Settings ***
Library    SeleniumLibrary
Library    ../Userdefined/CustomLibrary.py
Resource   ../resources/keywords.robot

*** Test Cases ***
End To End Account Creation
    [Documentation]    Open accountOpenPreLogin page and simulate account creation flow
    Open browser and navigate to    https://m.uat1.onlinebrokerage.cibc.com/dco/#/accountOpenPreLogin    chrome    Open an account | CIBC Investor’s Edge
    Select Account Type
    Before we Begin Page
    Choose Your Accounts
    Fill Introduce yourself form
    Capture account creation success
    Close Browser

