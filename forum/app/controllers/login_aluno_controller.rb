class LoginAlunoController < ApplicationController
  def index
  end

  def login
  	u = Usuario.find_by_username_and_senha(params[:username], Digest::MD5.hexdigest(params[:senha]))
    if u.nil?
        flash[:alert] = 'Nome ou senha invalidos'
        render 'index'
    else
        session[:usuario] = u.username
        redirect_to '/usuarios', notice:   ' Logado com sucesso'
    end
  end

  def logout
  end
end
