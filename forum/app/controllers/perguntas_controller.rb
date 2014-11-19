# encoding: UTF-8
class PerguntasController < ApplicationController

	def index
		@pergunta = Pergunta.all
	end

	def new
		@pergunta = Pergunta.new
	end

	def create
			@pergunta = Pergunta.new(params.require(:pergunta).permit(:texto))
			@pergunta.horario = Time.now
			@pergunta.usuario = Usuario.find_by_id(session[:id_usuario])
			@pergunta.n_respostas = 0
			@pergunta.respondida = 'n'
		if @pergunta.save
			redirect_to :perguntas, notice: "Pergunta #{@pergunta.texto} realizada com sucesso"
		else
			render :new
		end
	end

	def show
		@pergunta = Pergunta.find(params[:id])
		@usuario = Usuario.find(@pergunta.usuario)
	end

	def edit

	end

	def destroy
        p = Pergunta.find(params[:id])
        p.destroy
        redirect_to :perguntas, notice: "Pergunta #{p.texto} excluido"
    end
end
