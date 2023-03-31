*** Settings ***
Documentation    Suite de teste de autenticação
...              Administrador deve acessar o portal de gestão de academias

Resource    ../resources/base.resource

*** Test Cases ***
Login do Administrador  
     Go To Login Page
     Fill Crendentials    admin@smartbit.com    qacademy
     Submit Crendentials
     # outros exemplos
    #  Click    xpath=//button[text()="Entrar no sistema"]
    #  Click    text=Entrar no sistema
    User Should Be logged In    Admin

Email não cadastrado
     Go To Login Page
     Fill Crendentials    404@smartbit.com    qacademy
     Submit Crendentials
     Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha incorreta
    Go To Login Page
    Fill Crendentials    admin@smartbit.com    qacademi
    Submit Crendentials     
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
     Go To Login Page
     Fill Crendentials    @com.br    123456
     Submit Crendentials
     Field type Should Be Email
     Sleep    5

Senha em branco
    Go To Login Page
     Fill Crendentials    admin@smartbit.com    ${EMPTY}
     Submit Crendentials
     Arlet Text Should Be        password        A senha é obrigatória

Email em branco
    Go To Login Page
    Fill Crendentials        ${EMPTY}    qacademy
    Submit Crendentials
    Arlet Text Should Be        email        O e-mail é obrigatório

Email e senha são obrigatórios
    [Tags]    temp
    Go To Login Page
    Submit Crendentials
    Arlet Text Should Be        email        O e-mail é obrigatório
    Arlet Text Should Be        password        A senha é obrigatória
