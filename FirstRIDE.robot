*** Settings ***
Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           Screenshot
Library           Collections
Library           RequestsLibrary
Library           JsonLibrary

*** Variables ***
${URL}            http://www.google.com
${BROWSER}        Chrome
# Alternately https://accounts.lambdatest.com/profile you can also use xpath=//*[@id="tsf"]/div[2]/div/div[1]/div/div[1]/input
${search_form}    css=form[name=f]
${search_query}    css=input[name=q]
${search_term}    Lambdatest
@{grooming}

*** Test Cases ***
Google Search
    Wait Until Element Is Visible    ${search_form}
    Wait Until Element Is Visible    ${search_query}
    Input Text    ${search_query}    ${EMPTY}
    Input Text    ${search_query}    ${search_term}
    Submit Form

vDCM_Muxing
    Comment    Open Browser    https://10.50.234.91    gc    options=add_argument(--'ignore-certificate-errors')
    Open Browser    https://10.50.234.91    gc    options=add_argument('--allow-running-insecure-content');add_argument('--ignore-certificate-errors')
    Wait Until Element Is Visible    //*[@id='login']
    Take Screenshot    vdcm
    Input Text    //*[@id='login']    Administrator
    Input Password    //*[@id='password']    Administrator
    Click Button    //*[@id='login_button']
    Take Screenshot    vdcm1
    Wait Until Element Is Visible    //*[@id='Service_toggle']
    Click Element    //*[@id='Grooming']
    Comment    FOR    ${data}    IN    //*[@class='fi-help']
    ${elList}    get webelements    xpath=//*[@class='fi-help']
    Comment    FOR    ${item}    IN    ${elList}
    Comment    \    Click Element    ${elList}
    log    ${elList}
    Comment    log    Get Count    ${elList}
    ${titlefrommain}    Get Text    //div[@id='mainDIV']//div[@id='leftDIV']//table//thead//th//span
    Click Element    //*[@id='source_filter_table']/thead/tr/th/span/a
    log    ${titlefrommain}
    Comment    ${tab1}    Select Window    NEW    \    \    \    Select Window    NEW
    ${tab1}    Select Window    NEW
    ${title1}    Get Text    //*[@class='concepttitle']
    Close Window
    Select Window    ${tab1}
    log    ${title1}
    Click Element    //*[@id='target_filter_table']/thead/tr/th/span/a
    ${tab1}    Select Window    NEW
    ${title2}    Get Text    //*[@class='concepttitle']
    log    ${title2}
    Close All Browsers

ChromeOptions
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Go To    https://10.50.234.91
    Wait Until Element Is Visible    //*[@id='login']
    Take Screenshot    vdcm
    Close Browser

vDCM_TableView
    Open Browser    https://10.50.234.91    gc    options=add_argument('--allow-running-insecure-content');add_argument('--ignore-certificate-errors')
    Wait Until Element Is Visible    //*[@id='login']
    Take Screenshot    vdcm
    Input Text    //*[@id='login']    Administrator
    Input Password    //*[@id='password']    Administrator
    Click Button    //*[@id='login_button']
    Take Screenshot    vdcm1
    Wait Until Element Is Visible    //*[@id='Service_toggle']
    Click Element    //*[@id='GrOverview']
    Comment    FOR    ${data}    IN    //*[@class='fi-help']
    ${elList}    get webelements    xpath=//*[@class='fi-help']
    Comment    FOR    ${item}    IN    ${elList}
    Comment    \    Click Element    ${item}
    log    ${elList}
    Comment    log    Get Count    ${elList}
    ${titlefrommain}    Get Text    //div[@id='mainDIV']//table[@id='grooming_filter_table']//tr//th//span
    Click Element    //div[@id='mainDIV']//table[@id='grooming_filter_table']//tr//th//span[@class='fi-help']
    log    ${titlefrommain}
    Comment    ${tab1}    Select Window    NEW    \    \    \    Select Window    NEW
    ${tab1}    Select Window    NEW
    ${title1}    Get Text    //*[@class='topic']//div[@id='mc-main-content']/h1
    Close Window
    Select Window    ${tab1}
    log    ${title1}
    Comment    Click Element    //*[@id='target_filter_table']/thead/tr/th/span/a
    Comment    ${tab1}    Select Window    NEW
    Comment    ${title2}    Get Text    //*[@class='topic']//div[@id='mc-main-content']/h1
    Comment    log    ${title2}
    Close All Browsers

vDCM_TableView_Test
    Open Browser    https://10.50.234.70    gc    options=add_argument('--allow-running-insecure-content');add_argument('--ignore-certificate-errors')
    Wait Until Element Is Visible    //*[@id='login']
    Take Screenshot    vdcm
    Input Text    //*[@id='login']    Administrator
    Input Password    //*[@id='password']    Administrator
    Click Button    //*[@id='login_button']
    Take Screenshot    vdcm1
    Wait Until Element Is Visible    //*[@id='Service_toggle']
    Click Element    //*[@id='GrOverview']
    ${elList}    get webelements    xpath=//*[@class='fi-help']
    log    ${elList}
    ${count}    Get Length    ${elList}
    FOR    ${data}    IN    ${elList}
    log    ${data}
    ${EMPTY}
    Comment    ${attr}    Get Element Attribute    ${data}    href
    Comment    Click Link    ${attr}
    Comment    \    Click Element    ${count}
    Close All Browsers

REST_vDCM
    POST On Session
    Load JSON From File
