# 🚚 Projeto Logix

> **Sistema de Gestão Logística SaaS Multi-tenant**

## 📖 Sobre o Projeto

O **Projeto Logix** é uma solução completa em **SaaS (Software as a Service)** projetada para a gestão de transportadoras. Com uma arquitetura **Multi-tenant**, o sistema garante que múltiplas transportadoras possam utilizar a mesma infraestrutura mantendo total isolamento de dados.

O sistema foca no ciclo de vida completo do transporte de cargas, desde o cadastro da transportadora, gestão de frota e usuários, até a solicitação do cliente e execução final da entrega.

---

## 🚀 Fluxo de Trabalho e Regras de Negócio

O sistema opera com base em hierarquias e permissões estritas, garantindo que cada usuario veja apenas o que lhe é permitido.

### 1. Onboarding e Cadastros (Administrativo)
1.  **Cadastro da Transportadora:** A transportadora solicita o acesso ao **AdminLogix** (Super Admin).
2.  **Ativação:** O AdminLogix cadastra a Transportadora e cria o usuário **Admin da Transportadora**.
3.  **Configuração Interna:** O Admin da Transportadora acessa o sistema e cadastra seus recursos:
    * Usuarios Operacionais (Gerentes, Carregadores, Motoristas).
    * Veículos e Frota.

### 2. Fluxo do Cliente
* **Auto-cadastro:** O Cliente pode se cadastrar no sistema.
* **Solicitação:** O Cliente cria um **Pedido** especificando os detalhes da carga.
* **Matching:** O pedido torna-se visível/disponível para qualquer transportadora que seja compatível com os requisitos (veículos, rota, tipo de carga) solicitados.

### 3. Fluxo Operacional (O Ciclo do Pedido)
Uma vez que o pedido entra no sistema, o fluxo operacional segue:

1.  📦 **Pedido Recebido:** O pedido é aceito pela transportadora.
2.  📋 **Ordem de Carregamento:**
    * O **Gerente** ou **Admin** cria uma Ordem de Carregamento vinculada ao pedido.
    * A ordem é atribuída a um **Carregador**.
    * O **Carregador** realiza o checklist físico e sistêmico.
    * Após conferência, a Ordem de Carregamento é **finalizada**.
3.  🚚 **Ordem de Viagem:**
    * Após o carregamento, o **Gerente** ou **Admin** gera a Ordem de Viagem (baseada nos dados do carregamento).
    * A viagem é atribuída a um **Motorista**.
    * O **Motorista** realiza os checks de segurança e roteiro.
    * Ao concluir o trajeto, o Motorista finaliza a Ordem de Viagem.
4.  ✅ **Conclusão:** O pedido é marcado como entregue/finalizado.

---

## 🛠️ Tecnologias Utilizadas

O projeto foi desenvolvido utilizando tecnologias robustas para garantir performance e escalabilidade:

* **Linguagem:** Delphi (Object Pascal)
* **Framework Visual:** VCL (Visual Component Library)
* **Banco de Dados:** PostgreSQL (Relacional / SQL)
* **Relatórios:** FastReport (`.fr3`)
* **Middleware & Bibliotecas:**
    * **BCrypt:** Criptografia de senhas.
* **APIS:**
    * **viaCep:** para encontrar dados de ceps.
    * **openStreeMap:** para pegar latitude e longitude de Ceps.

---

## 📂 Estrutura do Projeto

A organização de pastas segue o padrão MVC/Service:

```text
├── src
│   ├── controller    # Controladores das rotas e lógica de entrada
│   ├── model         # Modelos de dados e entidades
│   ├── repository    # Camada de acesso ao banco de dados (DAO)
│   ├── service       # Regras de negócio complexas
│   ├── view          # Formulários e telas (VCL)
│   ├── DTO           # Data Transfer Objects
│   ├── DataBase      # Scripts SQL de criação e migração
│   └── log           # Logs de execução do sistema
└── reports           # Arquivos de layout do FastReport (.fr3)
