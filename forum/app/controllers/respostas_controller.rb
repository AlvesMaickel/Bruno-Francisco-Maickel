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
 		if @resposta.save
			redirect_to :perguntas, notice: "resposta #{@resposta.texto} realizada com sucesso"
		else
			render  "/perguntas/#{@pergunta.id}"
		end
	end

	
end
