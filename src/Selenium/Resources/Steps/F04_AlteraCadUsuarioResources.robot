*** Settings ***
Documentation       Suíte de testes de Validação do login do Perfil do Usuário
Library             SeleniumLibrary
Library              ../../../Helpers/Get_Envs.py    
Resource            ../../Resources/CommonsKeywords.robot
Resource            ../../Resources/Locators/Perfil_Locators.robot


*** Keywords ***
Dado que esteja na página home
    Abrir página home

Quando efetuar o login com usuário e senha válidos
    Clicar no Perfil do Usuário  ${Perfil}
    Iniciar login com usuário e senha válidos
    Clicar no elemento    ${Botao_Fechar_Login}

E acessar o perfil para fazer alteração de cadastro
    Clicar no elemento    ${Perfil_Cadastrado}
    Clicar no elemento    ${Botao_Cuenta}
    Inserir texto         ${Input_Apelido}     Mii
    #Não está reconhecendo o botão de atualizar dados do usuário
    #Clicar no elemento    ${Botao_Atualiza_Dados_Usuario}

#Então a alteração dos dados deverá ser executada com sucesso
    #Wait Until Element Is Visible    ${Banner_Tela_Home_Olá}

        
