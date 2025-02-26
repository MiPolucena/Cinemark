*** Settings ***
Documentation       Suíte de testes de Validação do login do Perfil do Usuário
Library             SeleniumLibrary
Resource            ../../Resources/CommonsKeywords.robot
Resource            ../../Resources/Locators/Perfil_Locators.robot


*** Keywords ***
Dado que esteja na página home
    Abrir página home

Quando clicar no perfil do usuário 
    Clicar no Perfil do Usuário  ${Perfil}

E clicar em criar conta
    Clicar no elemento   ${Botao_Crear_Cuenta}
    Clicar no elemento   ${Avatar}
    Inserir texto        ${Input_Nome}        Mirian Alves
    Inserir texto        ${Input_Apelido}     Mirian
    Inserir texto        ${Input_Email}       mirian.inacio+37@mblabs.com.br
    Inserir texto        ${Input_DtNascto}    10/05/2003
    Inserir texto        ${Input_Fone}        41999532254
    #Selecionar opcao     ${Input_Cinema}      Cinemark 10 Palermo
    # Clicar no elemento   ${Input_Genero}
    #Clicar no Checkbox    ${Informacion_estrenos} 


# E informar usuário e senha para efetuar o login
#     Inserir texto    ${Input_Usuario}    mirian.inacio+17@mblabs.com.br
#     Inserir texto    ${Input_Senha}      Cinemark123456!
#     Clicar no elemento   ${Botao_Iniciar_Session}

# Então o login deverá ser executado com sucesso
#     Wait Until Element Is Visible    ${Banner_Tela_Home_Olá}
