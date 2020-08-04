class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type
      t.datetime :date
      t.float :value
      t.string :cpf
      t.string :card
      t.string :owner
      t.string :name

      t.timestamps
    end
  end
end
