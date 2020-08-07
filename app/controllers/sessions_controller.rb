class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Conta acessada! Bem vindo #{user.name}."
      redirect_to root_url
    else
      flash[:danger] = 'Email ou senha incorreto.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    flash[:notice] = 'Volte sempre.'
    redirect_to root_path
  end
end
