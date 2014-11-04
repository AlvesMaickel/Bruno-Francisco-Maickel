#Encoding UTF-8
class UsuariosController < ApplicationController
   def index
   	@usuarios=Usuario.all
   end

   def new
        @usuario = Usuario.new
   end


   def create
   

          @usuario = Usuario.new(params.require(:usuario).permit(:username,:email,:senha))
          @usuario.tipo=Tipo.find_by_id(1)        
          if @usuario.save
              redirect_to :usuarios, notice: "Usuario #{@usuario.username} salvo"
          else
              render :new
          end
      

    end

     def edit
        @usuario = Usuario.find(params[:id])
     end

     def update
        @usuario = Usuario.find(params[:id])
        if @usuario.update(params.require(:usuario).permit(:username,:email,:senha))
            redirect_to :usuarios, notice: "Usuario #{@usuario.username} atualizado"
        else
            render :edit
        end
    end
   

    def show
        @usuario = Usuario.find(params[:id])
    end

   
end