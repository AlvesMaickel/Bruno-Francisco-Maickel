#Encoding UTF-8
require 'digest'
class UsuariosController < ApplicationController
   def index
   	@usuarios=Usuario.all
    if session[:admin]
         render layout: 'admin'
      end
     
     if session[:usuario].nil? and session[:admin].nil?
        redirect_to '/login'
     end 
     if session[:usuario]
        redirect_to '/perguntas'
     end
   end

   def new
      if session[:admin]
         render layout: 'admin'
      end
     
     if session[:usuario]
        redirect_to '/perguntas'
     end
        @usuario = Usuario.new
     

   end


   def create
   

          @usuario = Usuario.new(params.require(:usuario).permit(:username,:email,:senha))
          @usuario.tipo=Tipo.find_by_id(1)
          @usuario.senha = Digest::MD5.hexdigest(@usuario.senha)  
          if @usuario.save
              redirect_to :usuarios, notice: "Usuario #{@usuario.username} salvo"
          else
              render :new
          end
      

    end

     def edit
        @usuario = Usuario.find(params[:id])
         if session[:usuario]
         render layout: 'aluno'
        end
        if session[:usuario].nil? and session[:admin].nil?
        redirect_to '/login'
        end 
         if session[:admin]
         render layout: 'admin'
        end
     end

     def update
        @usuario = Usuario.find(params[:id])
        @usuario.senha = Digest::MD5.hexdigest(params[:senha])
        if @usuario.update(params.require(:usuario).permit(:username,:email))
            redirect_to :usuarios, notice: "Usuario #{@usuario.username} atualizado"
        else
            render :edit
        end
    end
   

    def show
        if session[:usuario]
         render layout: 'aluno'
        end
        
        if session[:usuario].nil? and session[:admin].nil?
        redirect_to '/login'
        end 
        
        if session[:admin]
         render layout: 'admin'
        end
        @usuario = Usuario.find(params[:id])
         
    end

   def destroy
        u = Usuario.find(params[:id])
        u.destroy
        redirect_to :usuarios, notice: "Usuario #{u.username} excluido"
    end
   
end