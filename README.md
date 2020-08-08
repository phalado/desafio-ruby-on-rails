# Desafio programação - para vaga desenvolvedor Ruby on Rails

Este repositório contém uma aplicação web para um desafio de Ruby on Rails  proposto pela empresa [bycoders_](https://github.com/ByCodersTec).
O teste consiste em parsear [este arquivo de texto(CNAB)](https://github.com/ByCodersTec/desafio-ruby-on-rails/blob/master/CNAB.txt) e salvar suas informações(transações financeiras) em uma base de dados.

## Conteúdo

- [Desafio programação - para vaga desenvolvedor Ruby on Rails](#desafio-programação---para-vaga-desenvolvedor-ruby-on-rails)
  - [Conteúdo](#conteúdo)
  - [Descrição do projeto](#descrição-do-projeto)
  - [Como acessar](#como-acessar)
  - [Documentação do CNAB (arquivo a ser acessado)](#documentação-do-cnab-arquivo-a-ser-acessado)
    - [Tabela descritiva](#tabela-descritiva)
    - [Documentação sobre os tipos das transações](#documentação-sobre-os-tipos-das-transações)
  - [Referência e desenvolvedor](#referência-e-desenvolvedor)

## Descrição do projeto

Este projeto consiste numa aplicação web para armazenamento e consulta de movimentação financeira por cartão de crédito de diversos estabelecimento comerciais. A forma de armazenamento dos dados é através do upload de um arquivo de texto *CNAB* e a apresentação é feita por uma tabela com os dados do estabelecimento que pode ser acessada por um administrador do sistema ou pelo proprietário do estabelecimento.

Nesta aplicação somente o administrador pode carregar dados e uma conta admnistradora não pode ser criada de maneira convencional.

## Como acessar

Para acessar a aplicação você tem duas escolhas:

1 - Versão online através do link https://desafio-ror-raphael.herokuapp.com/

2 - Seguindo os seguintes passos:

- Clone ou baixe este repositório

- No terminal, navegue até a pasta da aplicação

- Instale as bibliotecas necessárias com 
''''
bundle install
''''

- Migre o banco de dados
''''
rails db:migrate
''''

- Adicione algumas contas de usuário com 
''''
rails db:seed
''''

- Você pode rodar os testes para averiguar que tudo está correto com 
''''
rspec
''''

- Rode 
''''
rails server
''''

Existem duas contas préconfiguradas no banco de dados:

- Uma conta administrador com login 'admin@admin.com' e senha 'admin123'
- Uma conta comum com login 'joao@bar.com' e senha '123456'

## Documentação do CNAB (arquivo a ser acessado)

### Tabela descritiva

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação 
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

### Documentação sobre os tipos das transações

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |


## Referência e desenvolvedor

Este desafio foi forkeado [deste repositório](https://github.com/ByCodersTec/desafio-ruby-on-rails)

Raphael Cordeiro - [GitHub][rapha-github] - [Linkedin][rapha-linkedin] - [Portfolio][rapha-personal] - [Twitter][rapha-twitter]


<!-- Links -->
[rapha-github]: https://github.com/phalado
[rapha-twitter]: https://twitter.com/phalado
[rapha-linkedin]: https://www.linkedin.com/in/raphael-cordeiro/
[rapha-personal]: https://phalado.github.io/