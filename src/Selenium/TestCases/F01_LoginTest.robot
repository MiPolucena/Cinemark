*** Settings ***
Documentation    Suíte de testes de Validação do login do Perfil do Usuário
Library          ../../Helpers/Request_Warning.py
Library          ../../Helpers/Get_Envs.py
Resource         ../Resources/Steps/F01_LoginResources.robot


*** Test Cases ***
CT01: Efetuar login na página com sucesso
    [Tags]  F01CT01_Login
    [Documentation]  Card-XXX
    Dado que esteja na página home
    Quando clicar no perfil do usuário 
    E informar usuário e senha para efetuar o login
    Então o login deverá ser executado com sucesso


