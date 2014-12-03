# encoding: UTF-8
class ListasController < ApplicationController
	def index
		@listas = Lista.all

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

	def new
		@lista = Lista.new
		@conteudos = Conteudo.all
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

	def create
		format = params[:arq].original_filename
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
			dir = 'public/lista/'
			file = dir + uid + ".pdf"
			#FileUtils.cp File.open(arq.read,file)
			FileUtils.cp params[:arq].open, file
			redirect_to :listas, notice: "Lista #{@lista.nome} salva" and return
		else
			render :new and return
		end
	end

	def edit
		@lista = Lista.find(params[:id])
		@conteudos = Conteudo.all
		 if session[:admin]
         redirect_to '/perguntas'
        end

        if session[:usuario].nil? and session[:admin].nil?
            redirect_to '/login'
        end 

         if session[:usuario]
        redirect_to '/perguntas'
     end
	end

	def update
		@lista = Lista.find(params[:id])
		uid = SecureRandom.uuid
		params[:lista][:arquivo] = uid
		if @lista.update(params.require(:lista).permit(:nome,:arquivo))
			file = 'public/lista/' + uid +'.pdf'
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

		if session[:usuario]
         render layout: 'aluno'
        end
         if session[:admin]
         render layout: 'admin'
        end
       if session[:usuario].nil? and session[:admin].nil?
        redirect_to '/login'
       end   
	end

end
