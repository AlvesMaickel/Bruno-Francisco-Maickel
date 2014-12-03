require 'digest'
class LoginAlunoController < ApplicationController
  def index
     if session[:usuario]
         redirect_to '/perguntas'
        end
         if session[:admin]
         redirect_to '/perguntas'
        end
  end

  def login
  	u = Usuario.find_by_username_and_senha_and_tipo_id(params[:username], Digest::MD5.hexdigest(params[:senha]),Tipo.find(1))
    if u.nil?
        flash[:alert] = 'Nome ou senha invalidos'
        render 'index'
    else
        session[:usuario] = u.username
        session[:id_usuario] = u.id
        redirect_to '/perguntas'
    end
  end

 def logout
    reset_session
    redirect_to '/perguntas'

  end
  
end
