require 'rails_helper'

RSpec.describe User, type: :model do
  user0 = User.new(name: 'User0', email: 'user3@example.com', password: 'foobar')
  user1 = User.new(name: 'User1', password: 'foobar')
  user2 = User.new(name: 'User2', email: 'user4@example.com')
  user3 = User.new(name: 'User3', email: 'user5@example.com', password: 'fooba')
  user4 = User.new(email: 'user5@example.com', password: 'fooba')
  user5 = user0.dup
  user6 = User.new(name: '', email: 'user3@example.com', password: 'foobar')
  user7 = User.new(name: 'User7', email: '', password: 'foobar')

  it 'is valid if it has an email and a password' do
    expect(user0.save).to be_truthy
  end

  it "is invalid if it doesn't have an email address" do
    expect(user1.save).to be_falsy
  end

  it "is invalid if it doesn't have a password" do
    expect(user2.save).to be_falsy
  end

  it 'is invalid if its password has less than 6 digits' do
    expect(user3.save).to be_falsy
  end

  it 'is invalid if it doesn\'t have a name' do
    expect(user4.save).to be_falsy
  end

  it 'is invalid if it is an account that already exists' do
    user0.save
    expect(user5.save).to be_falsy
  end

  it 'is invalid if the name is too long' do
    51.times do
      user6.name << 'a'
    end
    expect(user6.save).to be_falsy
  end

  it 'is invalid if the email is too long' do
    244.times do
      user7.email << 'a'
    end
    user7.email << '@example.com'
    expect(user7.save).to be_falsy
  end
end
