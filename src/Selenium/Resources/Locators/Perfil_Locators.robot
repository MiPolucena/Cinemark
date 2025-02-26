*** Settings ***
Documentation       Variáveis de localização dos elementos da página de Login/Perfil do Usuário


*** Variables ***

#Imagens
${Avatar}                         xpath=/html/body/div[4]/div[3]/div[2]/div/form/div[1]/div[1]/div/div/div[1]/div/img
${Perfil}                         xpath=//*[@id="cnk-header"]/div[1]/div[1]/div/div[2]/button[3]
${Perfil_Cadastrado}              xpath=//*[@id="cnk-header"]/div[1]/div[1]/div/div[2]/button[3]/div/div/img

#Botões
${Botao_Accepto}                  xpath=xpath=/html/body/div[4]/div[2]/div[2]/button
${Botao_Iniciar_Session}          xpath=/html/body/div[4]/div[3]/div[2]/form/div[2]/button[1]
${Botao_Crear_Cuenta}             xpath=/html/body/div[4]/div[3]/div[2]/form/div[2]/button[3]
${Botao_Recupera_Senha}           xpath=/html/body/div[4]/div[3]/div[2]/form/div[2]/button[2]
${Botao_Validar_Recupera_Senha}   xpath=/html/body/div[4]/div[3]/div[2]/div/form/div[2]/button
${Botao_Fechar_Login}             xpath=/html/body/div[4]/div[3]/div/div/button
${Botao_Cuenta}                   xpath=/html/body/div[4]/div[3]/div[2]/div/div[5]/div/div[3]/button
${Botao_Atualiza_Dados_Usuario}   xpath=/html/body/div[1]/div[3]/div[2]/div[2]/form/div[4]/button

#Inputs
${Input_Usuario}                  xpath=//*[@id="email"]
${Input_Senha}                    xpath=//*[@id="password"]
${Input_Nome}                     xpath=//*[@id="firstName"]
${Input_Apelido}                  xpath=//*[@id="lastName"]
${Input_Email}                    xpath=//*[@id="email"]
${Input_DtNascto}                 xpath=/html/body/div[4]/div[3]/div[2]/div/form/div[2]/div/div[4]/div[1]/div/div/input
${Input_Fone}                     xpath=//*[@id="phoneNumber"]
${Input_Cinema}                   xpath=/html/body/div[4]/div[3]/div[2]/div/form/div[2]/div/div[6]/div/div
${Input_Genero}                   xpath=//*[@id=":rb:"]/li[2]
${Input_Senha}                    xpath=//*[@id="password"]
${Input_Confirma_Senha}           xpath=//*[@id="confirmPassword"]
${Input_Email_Recuperacao}        xpath=//*[@id="email"]

#Checkbox
${Informacion_estrenos}           xpath=//*[@id="newsletterEnabled"]/span[2]

#Banners
${Banner_Tela_Home}               xpath=(//img)[2]
${Banner_Tela_Home_Pontos}        xpath=/html/body/div[4]/div[3]/div/a/img
${Banner_Tela_Home_Olá}           xpath=/html/body/div[4]/div[3]/div/div
${Banner_Revisa_Email}            xpath=/html/body/div[4]/div[3]/div[2]/div/form/div[1]/h1






