# encoding: UTF-8
class RespostasController < ApplicationController


   def create
		    @resposta=Resposta.new(params.require(:resposta).permit(:texto))			
			@resposta.horario = Time.now
			@resposta.usuario = Usuario.find_by_id(session[:id_usuario])
			@resposta.pergunta=Pergunta.find(session[:pergunta])
            @resposta.util_n=0
            @resposta.util_s=0
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

	
end
