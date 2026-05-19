*** Settings ***
Library    SeleniumLibrary
Library    ../Userdefined/CustomLibrary.py


*** Keywords ***

Click Element When Ready
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}

Click Button When Ready
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Button    ${locator}

Type Into Field
    [Arguments]    ${locator}    ${text}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}

Select Dropdown Option
    [Arguments]    ${locator}    ${option}
    ${tag}=    Get Element Attribute    ${locator}    tagName
    Run Keyword If    '${tag}'=='select'    Select From List By Label    ${locator}    ${option}
    Run Keyword Unless    '${tag}'=='select'    Click Element When Ready     ${locator}
    Run Keyword Unless    '${tag}'=='select'    Click Element When Ready    xpath=//span[normalize-space(.)='${option}']
Ensure English Language Preference
    ${attribute}=    Get Element Attribute    id=radio-lang-pref-en    checked
    Run Keyword If    '${attribute}' != 'checked'    Click Element When Ready    id=radio-lang-pref-en
Register For Online Access
    [Arguments]    ${userid}    ${password}
    Type Into Field    id=user_id    ${userid}
    Type Into Field    id=signon_password    ${password}
    Type Into Field    id=signon_confirm_password    ${password}
    Click Element When Ready     id=radio-primary-ctrl-yes
    Click Button When Ready    id=submit_button
Open browser and navigate to
    [Arguments]    ${URL}    ${BROWSER}    ${Pagetitle}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    ${Pagetitle}
Select Account Type
    Click Element When Ready     id=unauth-option
    Click Element When Ready     xpath=//button[text()='Start application']
Before we Begin Page
    Click Element When Ready     id=userConcent
    Click Element When Ready     id=radio-third-party-no
    Click Element When Ready     xpath=//button[text()='Start application']
Choose Your Accounts
    FOR    ${id}    IN    tfsaAccount
        Wait Until Element Is Visible    id=${id}
        Click Element When Ready     id=${id}
    END
    Type Into Field    id=promocode_input    EDGENC25
    Click Button When Ready    xpath=//button[text()='Apply']
    Click Button When Ready    xpath=//button[@id='submit_button']

Fill Introduce yourself form
    Select Dropdown Option    id=title_select    1
    Select Dropdown Option    id=primary_dob_month    7
    Type Into Field    id=primary_dob_day    7
    Type Into Field    id=primary_dob_year    2002
    Press Keys    id=primary_dob_year    TAB
    ${sin}=    Generate Valid SIN
    Type Into Field    id=sin_input    ${sin}
    Press Keys    id=sin_input    TAB
    Select Dropdown Option    id=sin_expiry_month    7
    Type Into Field    id=sin_expiry_year    2030
    Type Into Field    id=email_input    gokulakannan0708@gmail.com
    Type Into Field    id=ao_primaryPhone_input    6789034567
    Type Into Field    id=addressInput    Toronto
    Wait Until Element Is Visible    id=address1    timeout=10s
    Click Element When Ready    id=address0
    Click Element When Ready    id=address1
    Click Element When Ready    id=ao_sameAddress_label
    Ensure English Language Preference
    Click Button    id=submit_button
    Click Button    xpath=//button[text()=' Confirm ']
    Click Element When Ready    xpath=//span[text()=' No ']
    Select Dropdown Option    id=country-dd    98: 660
    Click Button    id=submit_button
    Click Element When Ready    xpath=//span[text()=' No ']
    Select Dropdown Option    id=employmentStatus     1: EMPFT
    Select Dropdown Option    id=occupationCategory_select    1: 37
    Select Dropdown Option    id=occupations_select    1: 1408
    Select Dropdown Option    id=occupationDetail_select    39: 130
    Type Into Field    id=employerName_input    BMW
    Type Into Field    id=addressInput    Toronto
    Wait Until Element Is Visible    id=address1    timeout=10s
    Click Element When Ready    id=address0
    Click Element When Ready    id=address1
    Click Button    id=submit_button
    Type Into Field    id=liquidAssets_input    60000
    Type Into Field    id=fixedAssets_input    40000
    Type Into Field    id=liabilities_input    5000
    Type Into Field    id=annualIncome_input    200000
    Wait Until Element Is Visible    id=yearsInvestingInput
    Type Into Field    id=yearsInvestingInput    0
    Click Element When Ready    id=link_acc_radio-no
    Click Element When Ready    id=designateBeneficiary-radio-no
    Click Element When Ready    id=submit_button
    Click Element When Ready    id=radio-primary-ctrl-no
    Click Element When Ready    id=radio-primary-insider-no
    Click Element When Ready    id=radio-primary-Pro-no
    Click Element When Ready    id=radio-objection-no
    Click Element When Ready    id=radio-security-none
    Click Element When Ready    id=id-physical
    Click Element When Ready    id=submit_button
    Click Element When Ready    id=ao_terms_label
    Click Element When Ready    id=tax_suppression_checkbox
    Click Element When Ready    id=esign-physical
    Click Element When Ready    id=submit_button
    Register for online access    messi007    Welcome1
Capture account creation success
    ${text}    Get Text    id=//div[@class='inst1']
    Should Be Equal    ${text}    Your user ID and password are all set.












