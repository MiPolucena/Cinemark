*** Settings ***
Documentation   Resource para os steps comuns a todos os testes
# Library         OperatingSystem
# Library         DateTime
# Library         String
# LIbrary         json
Library         SeleniumLibrary
Library         RequestsLibrary
Library         Collections
Library         ../../Helpers/Get_Envs.py    # Biblioteca para pegar as variáveis de ambiente
Library         ../../Helpers/Request_Warning.py
Resource         ../Resources/Locators/Perfil_Locators.robot
#Resource        variables/Globais.robot


*** Keywords ***

# ---- STEPS
Abrir página home
 #Função para evitar warnings de requisições inseguras:
     Disable Request Warning

    ${ENVS}    Get Environment Variables
    Set Global Variable    ${ENVS}    ${ENVS}

    # Ela cria um objeto ChromeOptions, que será usado para configurar o comportamento do navegador no Selenium.
    # Esse objeto permite adicionar argumentos e personalizar a inicialização do navegador (exemplo: desativar infobars, definir preferências de privacidade, etc.).
#    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options}    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver


    #profile.default_content_setting_values.media_stream_mic/camera Permite acesso ao microfone/câmera. → Isso só é necessário se o site precisar dessas permissões:
    #profile.default_content_setting_values.geolocation/notifications → Permite localização e notificações. Pode ser desnecessário se a página não usar essas permissões:
    ${prefs}    Evaluate
    ...    {'profile.default_content_setting_values.media_stream_mic': 1, 'profile.default_content_setting_values.media_stream_camera': 1, 'profile.default_content_setting_values.geolocation': 1, 'profile.default_content_setting_values.notifications': 1}
   
   #Desativa a barra de informações do Chrome (opcional:
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
   
    #Cria o navegador com as opções configuradas:
    Create Webdriver    Chrome    options=${options}
    Maximize Browser Window
    Go To    ${ENVS['BASE_URL']}

Abrir página de alteracao de senha
    Disable Request Warning

    ${ENVS}    Get Environment Variables
    Set Global Variable    ${ENVS}    ${ENVS}

    ${options}    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver
       
    #Cria o navegador com as opções configuradas:
    Create Webdriver    Chrome    options=${options}
    Maximize Browser Window
    Go To    ${ENVS['BASE_URL']}
    #Ver uma forma de abrir o endereço já que tenha a drawer de alteração de senha. ex:
    #Go To    ${ENVS['BASE_ALTERA_SENHA']}

Clicar no Perfil do Usuário
    [Arguments]    ${Perfil}
    Sleep    10
    Clicar no elemento   ${Botao_Accepto}
    Clicar no elemento   ${Perfil}
    
Clicar no elemento
    [Arguments]    ${ELEMENT}
    Wait Until Element Is Visible
    ...    ${ELEMENT}
    ...    timeout=10
    ...    error=Elemento ${ELEMENT} não foi encontrado durante a execução do caso de teste: ${TEST_NAME}
    Click Element    ${ELEMENT}

Iniciar login com usuário e senha válidos
    Inserir texto        ${Input_Usuario}    mirian.inacio+3@mblabs.com.br
    Inserir texto        ${Input_Senha}      Cinemark123456!
    Clicar no elemento   ${Botao_Iniciar_Session}

Inserir texto
    [Arguments]    ${FIELD}    ${Text}
    Wait Until Element Is Visible
    ...    ${FIELD}
    ...    error=Elemento ${FIELD} não foi encontrado durante a execução do caso de teste: ${TEST_NAME}
    Input Text    ${FIELD}    ${Text}

Selecionar opcao
    [Arguments]    ${FIELD}    ${Text}
    Select Frame    ${FIELD}
    Wait Until Element Is Visible
    ...    ${FIELD}  timeout=10s
    ...    error=Elemento ${FIELD} não foi encontrado durante a execução do caso de teste: ${TEST_NAME}
    Click Element  ${FIELD}
    Unselect Frame
    #Select From List By Label    ${FIELD}    ${Text}

Clicar no Checkbox
    [Arguments]    ${FIELD}
    Wait Until Element Is Visible
    ...    ${FIELD}
    ...    error=Elemento ${FIELD} não foi encontrado Checkbox  
    Select Checkbox    ${FIELD} 

# # ---- STEPS
# Definir ENVS
#     ${ENVS}    Get Enviroment Variables
#     Set Global Variable    ${ENVS}    ${ENVS}

# ---- ENTÃO
# Então a operação deve ocorrer com sucesso (status_code=${status_code_esperado})
#     Conferir status_code da requisição    ${status_code_esperado}    ${RESPONSE}

# Então a operação deve ocorrer sem sucesso (status_code=${status_code_esperado})
#     Conferir status_code da requisição    ${status_code_esperado}    ${RESPONSE}

# # ---- CONFERÊNCIAS

# Conferir retorno de mensagens
#     [Arguments]   ${Response_Msg_Retorno}     ${Atributos_MsgRetorno}     
#     FOR    ${key}    IN    @{Atributos_MsgRetorno}
#         Dictionary Should Contain Key    ${Response_Msg_Retorno}    ${key}
#     END


# -- STATUS_CODE

# Conferir retorno do status_code
#     [Arguments]    ${status_code_retornado}  ${status_code_retornado}
#     Should Be Equal As Numbers    ${status_code_retornado}    ${status_code_retornado}

# Conferir status_code da requisição
#     [Arguments]  ${status_code_esperado}  ${resultado}
#     Status Should Be  ${status_code_esperado}  ${resultado}
#     ...  msg=FALHA: O status_code não é o esperado pelo teste! Verifique!${\n}Status esperado: ${status_code_esperado} <> retornado: ${resultado.status_code}

# Conferir msg de retorno do json
#     [Arguments]    ${msg_retornada}  ${msg_esperada}
#     Dictionary Should Contain Key    ${msg_retornada}   ${msg_esperada}


# ---- SETUP
# Conectar Autorizado na API
#     [Arguments]         ${BASE}
#     ${headers}          Create Dictionary    Content-Type=application/json   
#     ${ALIAS}            Create Session       alias=${ALIAS_GLOBAL}     url=${BASE}   headers=${headers}
#     Set Suite Variable  ${headers}

# Conectar na API de AquisicaoCadastro
#     [Arguments]    ${BASE}    ${TOKEN} 
#     ${headers_aquisicao}      Create Dictionary   Content-Type=application/json    authorization=${ENVS[${TOKEN}]}
#     ${alias_aquisicao}        Create Session      alias=${ALIAS_GLOBAL}     url=${BASE}   headers=${headers_aquisicao}    verify=False
#     Set Suite Variable        ${headers_aquisicao}
#     Set Suite Variable        ${alias_aquisicao}

# Conectar na API para importar arquivo
#     [Arguments]    ${BASE}    ${TOKEN} 
#     ${headers_aquisicao}      Create Dictionary    authorization=${ENVS[${TOKEN}]}
#     ${alias_upload}           Create Session      alias=uploads3  url=${BASE}     headers=${headers_aquisicao}    verify=False
#     Set Suite Variable        ${headers_aquisicao}
#     Set Suite Variable        ${alias_upload}

# Conectar na API para importar contratos
#     [Arguments]    ${BASE}    ${TOKEN}
#     ${headers_contratos}      Create Dictionary   Content-Type=application/json    authorization=${ENVS[${TOKEN}]}
#     ${alias_contratos}        Create Session      alias=importacontratos     url=${BASE}   headers=${headers_contratos}    verify=False
#     Set Suite Variable  ${headers_contratos}     
#     Set Suite Variable  ${alias_contratos} 

# ---- TEARDOWN
# Encerrar Conexões com a API
#     Delete All Sessions

# # ---- DADO
# Dado que estou conectado na API do Core dados
#     Session Exists      ${ALIAS_GLOBAL}
    
# Dado que estou conectado na API
#     ${headers}          Create Dictionary   Content-Type=application/json  
#     Create Session      ${ALIAS_GLOBAL}     url=${BASE_SERVICE}       headers=${headers} 
#     Set Suite Variable  ${headers}
#     Session Exists      ${ALIAS_GLOBAL}

# Dado que estou conectado na API de Aquisição
#     [Arguments]    ${alias_aquisicao}
#     Session Exists      ${alias_aquisicao}

# Dado que estou conectado na API de consulta de InstallmentCode
#     ${headers}          Create Dictionary   Content-Type=application/json  
#     Create Session      ${ALIAS_GLOBAL}     url=${BASE_PREPARE}       headers=${headers} 
#     Set Suite Variable  ${headers}
#     Session Exists      ${ALIAS_GLOBAL}

