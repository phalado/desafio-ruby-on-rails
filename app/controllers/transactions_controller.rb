class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    # file = File.open()
    file_data = File.read(params[:uploaded_file][:attachment])
    file_data.each_line do |line|
      transaction = Transaction.new(
        transaction_type: line[0].to_i,
        date: line[1...9] + line[42...48],
        value: line[9...19].to_f / 100,
        cpf: line[19...30],
        card: line[30...42],
        owner: line[48...62].strip,
        name: line[62...80].strip,
      )
      transaction.save
    end
  end

  def show
  end
end
