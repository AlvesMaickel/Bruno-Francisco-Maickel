require 'digest'
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
        session[:id_usuario] = u.id
        redirect_to '/usuarios'
    end
  end

 def logout
    reset_session
    redirect_to '/usuarios'

  end
  
end
