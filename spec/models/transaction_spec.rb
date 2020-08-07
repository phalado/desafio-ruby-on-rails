require 'rails_helper'

RSpec.describe Transaction, type: :model do
  T0 = Transaction.new()
  T0.transaction_type = 1
  T0.date = '20201212'
  T0.value = 100.00
  T0.cpf = '12345678900'
  T0.card = '1234****5678'
  T0.owner = 'Fulano de tal'
  T0.name = 'Loja do Fulano'

  it 'is valid if it has all the fields filled' do
    expect(T0.save).to be_truthy
  end

  it 'is invalid if transaction type is missing' do
    T0.transaction_type = nil
    expect(T0.save).to be_falsy
  end

  it 'is invalid if date is missing' do
    T0.date = nil
    expect(T0.save).to be_falsy
  end

  it 'is invalid if value is missing' do
    T0.value = nil
    expect(T0.save).to be_falsy
  end

  it 'is invalid if cpf is missing' do
    T0.cpf = nil
    expect(T0.save).to be_falsy
  end

  it 'is invalid if cpf length is smaller than 11' do
    T0.cpf = '1234567890'
    expect(T0.save).to be_falsy
  end

  it 'is invalid if cpf length is bigger than 11' do
    T0.cpf = '123456789000'
    expect(T0.save).to be_falsy
  end

  it 'is invalid if card is missing' do
    T0.card = nil
    expect(T0.save).to be_falsy
  end

  it 'is invalid if card length is smaller than 12' do
    T0.card = '1234****567'
    expect(T0.save).to be_falsy
  end

  it 'is invalid if card length is bigger than 12' do
    T0.card = '1234****56789'
    expect(T0.save).to be_falsy
  end

  it 'is invalid if owner is missing' do
    T0.owner = nil
    expect(T0.save).to be_falsy
  end

  it 'is invalid if owner length is bigger than 15' do
    T0.owner = ''
    16.times do 
      T0.owner << 'a'
    end
    expect(T0.save).to be_falsy
  end

  it 'is invalid if owner is missing' do
    T0.name = nil
    expect(T0.save).to be_falsy
  end

  it 'is invalid if owner length is bigger than 15' do
    T0.name = ''
    19.times do 
      T0.name << 'a'
    end
    expect(T0.save).to be_falsy
  end
end
