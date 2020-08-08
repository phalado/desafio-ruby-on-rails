require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      user0 = User.new(name: 'User0', email: 'user0@example.com', password: 'foobar', admin: true)
      user0.save
      session = { session: { email: 'user0@example.com', password: 'foobar' } }
      post sessions_new_path(session)
      get transactions_new_path
      expect(response).to have_http_status(:success)
      expect(response.body).to match('Adicionar transações')
    end

    it 'access denied to non adminstrator users' do
      user0 = User.new(name: 'User0', email: 'user0@example.com', password: 'foobar')
      user0.save
      session = { session: { email: 'user0@example.com', password: 'foobar' } }
      post sessions_new_path(session)
      get transactions_new_path
      expect(response).to have_http_status(:found)
      expect(response.body).to match('Apenas administradores podem acessar este recurso.')
    end
  end

  describe 'GET /show' do
    T0 = Transaction.new
    T0.transaction_type = 1
    T0.date = '20201212'
    T0.value = 100.00
    T0.cpf = '12345678900'
    T0.card = '1234****5678'
    T0.owner = 'Fulano de tal'
    T0.name = 'Loja do Fulano'

    T1 = Transaction.new
    T1.transaction_type = 1
    T1.date = '20201212'
    T1.value = 100.00
    T1.cpf = '12345678900'
    T1.card = '1234****5678'
    T1.owner = 'Ciclano de tal'
    T1.name = 'Loja do Ciclano'

    it 'returns http success' do
      T0.save
      T1.save
      get transactions_show_path
      expect(response).to have_http_status(:success)
      expect(response.body).to match('Você não tem nenhuma transação registrada')
    end

    it 'returns http success' do
      T0.save
      T1.save
      user0 = User.new(name: 'Fulano de tal', email: 'user0@example.com', password: 'foobar', admin: true)
      user0.save
      session = { session: { email: 'user0@example.com', password: 'foobar' } }
      post sessions_new_path(session)
      get transactions_show_path
      expect(response).to have_http_status(:success)
      expect(response.body).to match('Você não tem nenhuma transação registrada')
    end
  end
end
