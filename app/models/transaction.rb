class Transaction < ApplicationRecord
  validates :transaction_type, presence: true
  validates :date, presence: true
  validates :value, presence: true
  validates :cpf, presence: true, length: { is: 11 }
  validates :card, presence: true, length: { is: 12 }
  validates :owner, presence: true, length: { maximum: 15 }
  validates :name, presence: true, length: { maximum: 18 }
end
