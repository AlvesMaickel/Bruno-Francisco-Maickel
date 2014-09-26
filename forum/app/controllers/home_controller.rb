# encoding: UTF-8
class HomeController < ApplicationController

	def index
		@perguntas = Pergunta.all
	end

	def show
		@pergunta = Conteudo.find(params[:id])
	end

end
