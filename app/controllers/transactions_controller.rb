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
    p params
    p params['name']
    if params['user']
      user = User.find(params['user'].to_i)
      transactions = Transaction.where('owner = (?)', user.name)
    else
      transactions = Transaction.where('owner = (?)', params['name'])
    end

    t_types = {
      1 => ['Débito', 1],
      2 => ['Boleto', -1],
      3 => ['Financiamento', -1],
      4 => ['Crédito', 1],
      5 => ['Recebimento Empréstimo', 1],
      6 => ['Vendas', 1],
      7 => ['Recebimento TED', 1],
      8 => ['Recebimento DOC', 1],
      9 => ['Aluguel', -1],
    }

    @final_value = 0
    @my_transactions = []
    transactions.each do |t|
      @my_transactions.push([t_types[t.transaction_type][0], t_types[t.transaction_type][1], t])
      @final_value += t.value * t_types[t.transaction_type][1]
    end
  end

  def index
    @owners = []
    transactions = Transaction.all
    transactions.each do |t|
      @owners << t.owner unless @owners.include?(t.owner)
    end
    p @owners
  end
end
