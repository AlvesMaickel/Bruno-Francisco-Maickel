# encoding: UTF-8
class ListasController < ApplicationController
	def index
		@listas = Lista.all
	end

	def new
		@lista = Lista.new
		@conteudos = Conteudo.all
	end

	def create
		format = params[:lista][:arquivo].original_filename
		format2 = format.split('.').last
		uid = SecureRandom.uuid
		@lista = Lista.new
		if format2 == "pdf"
			nome = params[:lista][:nome]
			@lista.nome = nome
			@lista.arquivo = uid
			c = Conteudo.new
			c = Conteudo.find(params[:conteudo].to_i)
			@lista.conteudo = c
		else
			render :new, notice: "Formato de arquivo inválido. O arquivo deve ser .pdf" and return
		end

		if @lista.save
			dir = 'public/listas/'
			arq = params[:lista][:arquivo]
			file = dir + uid + ".pdf"
			#FileUtils.cp File.open(arq.read,file)
			arq.close
			redirect_to :listas, notice: "Lista #{@lista.nome} salva" and return
		else
			render :new and return
		end
	end

	def edit
		@lista = Lista.find(params[:id])
		@conteudos = Conteudo.all
	end

	def update
		@lista = Lista.find(params[:id])
		uid = SecureRandom.uuid
		params[:lista][:arquivo] = uid
		if @lista.update(params.require(:lista).permit(:nome,:arquivo))
			file = 'public/uploads/' + uid +'.pdf'
			arq = params[:lista][:arquivo]
			#FileUtils.cp (arq.read,file)
			redirect_to :listas, notice: "Lista #{@lista.nome} atualizada"
		else
			if format != "pdf"
				render :edit,  notice: "Formato de arquivo inválido. O arquivo deve ser .pdf"
			elsif format == "pdf"
				render :edit
			end
		end
	end

	def destroy
		@lista = Lista.find(params[:id])
		@lista.destroy
		redirect_to :listas, notice: "Lista #{@lista.nome} excluída"
	end

	def show
		@lista = Lista.find(params[:id])
		@conteudo = Conteudo.find(@lista.conteudo)
	end

end
