*** Settings ***
Documentation    Suíte de testes de Validação do login do Perfil do Usuário
Library          ../../Helpers/Request_Warning.py
Library          ../../Helpers/Get_Envs.py
Resource         ../Resources/Steps/F03_RecuperacaoSenhaResources.robot


*** Test Cases ***
CT01: Efetuar cadastro de recuperação de senha com sucesso
    [Tags]  F03CT01_RecuperaSenha
    [Documentation]  Card-XXX
    Dado que esteja na página home
    Quando clicar no perfil do usuário 
    E clicar em Olvidé mi contraseña
    E informar email para recuperar a senha    
    Então deverá exibir mensagem para verificar correio eletrônico

CT02: Efetuar cadastro de nova senha com sucesso
    [Tags]  F03CT02_CadastraSenha
    [Documentation]  Card-XXX
    Dado que esteja na página de alteração de senha
    #Quando informar novo email no campo Nueva contraseña
    # E informar senha no campo Confirma tu nueva contraseña
    # E clicar em Restaurar contraseña
    # Então deverá exibir mensagem de senha alterada com sucesso     
    

