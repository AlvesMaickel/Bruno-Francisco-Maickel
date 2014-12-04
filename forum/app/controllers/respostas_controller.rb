# encoding: UTF-8
class RespostasController < ApplicationController


   def create
		    @resposta=Resposta.new(params.require(:resposta).permit(:texto))			
			@resposta.horario = Time.now
			@resposta.usuario = Usuario.find_by_id(session[:id_usuario])
			@resposta.pergunta=Pergunta.find(session[:pergunta])
            @resposta.util_n=0
            @resposta.util_s=0
            if session[:usuario]
            	@resposta.username=session[:usuario]
            end
             if session[:admin]
            	@resposta.username=session[:admin]
            end
            @pergunta=Pergunta.find(session[:pergunta])	
            n=@pergunta.n_respostas + 1
            @pergunta.update_attribute(:respondida,'s')            
            @pergunta.update_attribute(:n_respostas,n)
 		if @resposta.save
			
			redirect_to "/perguntas/#{@pergunta.id}", notice: "resposta #{@resposta.texto} realizada com sucesso"
		else
			redirect_to "/perguntas/#{@pergunta.id}"
		end
	end



    def edit
      
        @resposta = Resposta.find(params[:id])
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
        @resposta = Resposta.find(params[:id])
      
        if @resposta.update(params.require(:resposta).permit(:texto))
           redirect_to "/perguntas/#{@resposta.pergunta_id}"
        else
           redirect_to "http://localhost:3000/respostas/#{@resposta.id}/edit"
        end
    end
   

     def destroy
        r = Resposta.find(params[:id])
        r.destroy
        redirect_to "/perguntas/#{r.pergunta_id}"
    end


	
end
