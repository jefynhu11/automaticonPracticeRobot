*** Settings ***
Documentation       Essa suíte testa o site da Automation Praction
Resource            automationPractice_resource.robot
Test Setup          Abrir o navegador
#Test Teardown       Fecha o navegador

*** Test Cases ***
Caso de Teste 01 - Compra de um produto
    [Documentation]     Esse teste verifica realizando a validação de sucesso no final e 
    ...                 utilizando Faker para gerar os dados do cadastro
    
    Acessa do site Automation Practice
    Verificar se o título da página fica "My Store"
    Preenche pesquisa no campo "Blouse"
    Clica botão lupa
    Seleciona um produto
    Adiciona carrinho
    Proceed to checkout
    Summary Proceed to checkout
    Criar email
    Preenche cadastrar
    Sleep   5
    #Verificar se aparece a frase "Mais vendidos"
    #Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    #Verificar se aparece a categoria "Computadores e Informática"