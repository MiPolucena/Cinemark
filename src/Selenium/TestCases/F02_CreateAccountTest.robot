*** Settings ***
Documentation    Suíte de testes de Validação do login do Perfil do Usuário
Library          ../../Helpers/Request_Warning.py
Library          ../../Helpers/Get_Envs.py
Resource         ../Resources/Steps/F02_CreateAccountResources.robot


*** Test Cases ***
CT01: Efetuar criação de conta com sucesso
    [Tags]  F02CT01_CreateAccount
    [Documentation]  Card-XXX
    Dado que esteja na página home
    Quando clicar no perfil do usuário 
    E clicar em criar conta 
    # Então o login deverá ser executado com sucesso


