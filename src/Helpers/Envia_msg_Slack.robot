*** Settings ***
Library     ../Helpers/Absolute_path.py    
Library     ../Helpers/Get_Envs.py
Library     ../Helpers/Get_Resultado_Automacao.py
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
# Library    Get_Envs
# Library    Get_Envs
 

*** Tasks ***
Report_Tests
    ${result}    Creat_Report_Body

    ${ENVS}    Get Environment Variables
    Curl_Request    ${result}    ${ENVS['SLACK_INCOMING_WEBHOOK_URL']}

*** Keywords ***
Creat_Report_Body
    ${reportWebCinemark}        Set Variable               LogWebCinemark\\output.xml
    ${pathWebCinemark}          Get Absolute Path          ${reportWebCinemark}
    ${msgWebCinemark}           Get Resultado Automacao    ${pathWebCinemark}   WebCinemark

    ${result}    Set Variable    ${msgWebCinemark}
    Create File    report/test_status.txt    ${result}
    Sleep    5s
    RETURN    ${result}

Curl_Request
    [Arguments]    ${msg}    ${webhook}

    ${headers}    Create Dictionary    Content-type=application/json
    ${json_data}    Create Dictionary    text=${msg}

    POST    url=${webhook}    headers=${headers}    json=${json_data}    expected_status=200