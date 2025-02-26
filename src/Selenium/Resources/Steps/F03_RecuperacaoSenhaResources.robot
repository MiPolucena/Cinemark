*** Settings ***
Documentation       Suíte de testes de Validação do login do Perfil do Usuário
Library             SeleniumLibrary
Library              ../../../Helpers/Get_Envs.py    
Resource            ../../Resources/CommonsKeywords.robot
Resource            ../../Resources/Locators/Perfil_Locators.robot


*** Keywords ***
Dado que esteja na página home
    Abrir página home

Dado que esteja na página de alteração de senha
    Abrir página de alteracao de senha


Quando clicar no perfil do usuário 
    Clicar no Perfil do Usuário  ${Perfil}

E clicar em Olvidé mi contraseña
    Clicar no elemento   ${Botao_Recupera_Senha}

E informar email para recuperar a senha
    Inserir texto        ${Input_Email_Recuperacao}    mirian.inacio+3@mblabs.com.br
    Clicar no elemento   ${Botao_Validar_Recupera_Senha}

Então deverá exibir mensagem para verificar correio eletrônico
    Wait Until Element Is Visible    ${Banner_Revisa_Email}
