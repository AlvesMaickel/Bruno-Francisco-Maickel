# encoding: UTF-8
class ConteudosController < ApplicationController

	def index
		@conteudos = Conteudo.all
		if session[:usuario]
         render layout: 'aluno'
        end
        
	end

	def new
		@conteudo = Conteudo.new
	end

	def create
		format = params[:arq].original_filename
		format2 = format.split('.').last
		uid = SecureRandom.uuid
		#puts ">>>>>>>"
		#p params[:arq]
		#puts params[:arq].class
		#File.open("public/teste.pdf","w"){|f| f.write(params[:arq].open)}

		# file = 'public/teste.pdf'
		#redirect_to '/conteudos'
		@conteudo = Conteudo.new

		if format2 == "pdf"
			nome = params[:conteudo][:nome]
			@conteudo.nome = nome
			@conteudo.arquivo = uid
			@conteudo.bimestre = params[:conteudo][:bimestre]
		else
			render :new, notice: "Formato de arquivo inválido. O arquivo deve ser .pdf" and return
		end

		if @conteudo.save
			dir = 'public/conteudo/'
			arq = params[:arq]
			file = dir + uid + ".pdf"
			FileUtils.cp params[:arq].open, file
			#FileUtils.cp File.open(arq.read,file)
			arq.close
			redirect_to :conteudos, notice: "Conteúdo #{@conteudo.nome} salvo" and return
		else
			render :new and return
		end
		
	end

	def edit
		@conteudo = Conteudo.find(params[:id])
	end

	def update
		@conteudo = Conteudo.find(params[:id])
		uid = SecureRandom.uuid
		params[:conteudo][:arquivo] = uid
		if @conteudo.update(params.require(:conteudo).permit(:nome,:arquivo,:bimestre))
			file = 'public/conteudos/' + uid +'.pdf'
			arq = params[:conteudo][:arquivo]
			#FileUtils.cp (arq.read,file)
			redirect_to :conteudos, notice: "Conteúdo #{@conteudo.nome} atualizado"
		else
			if format != "pdf"
				render :edit,  notice: "Formato de arquivo inválido. O arquivo deve ser .pdf"
			elsif format == "pdf"
				render :edit
			end
		end
	end

	def destroy
		@conteudo = Conteudo.find(params[:id])
		@conteudo.destroy
		redirect_to :conteudos, notice: "Conteúdo #{@conteudo.nome} excluído"
	end

	def show
		@conteudo = Conteudo.find(params[:id])
		if session[:usuario]
         render layout: 'aluno'
        end
        
	end

end
