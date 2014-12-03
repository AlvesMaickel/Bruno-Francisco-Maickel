require 'digest'
class LoginAdminController < ApplicationController
   def index
  end

  def login2
  	u = Usuario.find_by_username_and_senha_and_tipo_id(params[:username], Digest::MD5.hexdigest(params[:senha]),Tipo.find(2))
    if u.nil?
        flash[:alert] = 'Nome ou senha invalidos'
        render 'index'
    else
        session[:admin] = u.username
        session[:id_usuario] = u.id
        redirect_to '/perguntas'
    end
  end

 def logout2
    reset_session
    redirect_to '/perguntas'

  end
 
end
