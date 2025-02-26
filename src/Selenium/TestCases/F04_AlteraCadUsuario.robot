*** Settings ***
Documentation    Suíte de testes de Validação do login do Perfil do Usuário
Library          ../../Helpers/Request_Warning.py
Library          ../../Helpers/Get_Envs.py
Resource         ../Resources/Steps/F04_AlteraCadUsuarioResources.robot


*** Test Cases ***
CT01: Efetuar alteração no cadastro do usuário
    [Tags]  F04CT01_AlteraCadUsuário
    [Documentation]  Card-XXX
    Dado que esteja na página home
    Quando efetuar o login com usuário e senha válidos
    E acessar o perfil para fazer alteração de cadastro
    # Então a alteração dos dados deverá ser executada com sucesso


