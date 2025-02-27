*** Settings ***
Documentation       Suíte de testes de Validação do login do Perfil do Usuário
Library             SeleniumLibrary
Library              ../../../Helpers/Get_Envs.py    
Resource            ../../Resources/CommonsKeywords.robot
Resource            ../../Resources/Locators/Perfil_Locators.robot


*** Keywords ***
Dado que esteja na página home
    Abrir página home
     
Quando clicar no perfil do usuário 
    Clicar no Perfil do Usuário  ${Perfil}

E informar usuário e senha para efetuar o login
    Iniciar login com usuário e senha válidos

Então o login deverá ser executado com sucesso
    Wait Until Element Is Visible    ${Banner_Tela_Home_Olá}
