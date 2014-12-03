# encoding: UTF-8
class PerguntasController < ApplicationController

	def index
		@pergunta = Pergunta.all
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

	def new
		@pergunta = Pergunta.new
		@conteudos = Conteudo.all
		@listas = Lista.all

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

	def create
			@pergunta = Pergunta.new(params.require(:pergunta).permit(:texto))
			@pergunta.horario = Time.now
			@pergunta.usuario = Usuario.find_by_id(session[:id_usuario])
			@pergunta.n_respostas = 0
			@pergunta.respondida = 'n'
		
		if @conteudo=Conteudo.find_by_nome(params[:conteudo])
			@pergunta.conteudo=Conteudo.find(@conteudo) 
		end 
        
        if @lista=Lista.find_by_nome(params[:lista])
			@pergunta.lista=Lista.find(@lista) 
		end 
			
		if @pergunta.save
			redirect_to :perguntas, notice: "Pergunta #{@pergunta.texto} realizada com sucesso"
		else
			redirect_to "http://localhost:3000/perguntas/new"
		end
	end


	def show
		@pergunta = Pergunta.find(params[:id])
		@usuario = Usuario.find(@pergunta.usuario)
		session[:pergunta] = @pergunta.id
		@respostas = Resposta.where("pergunta_id=?",@pergunta.id)
		@resposta= Resposta.new
        
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

	def edit
		@pergunta = Pergunta.find(params[:id])
		@conteudos = Conteudo.all
		@listas = Lista.all
        
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

	def update

        @pergunta = Pergunta.find(params[:id])

		if @conteudo=Conteudo.find_by_nome(params[:conteudo])
			@pergunta.conteudo=Conteudo.find(@conteudo) 
		end 
        
        if @lista=Lista.find_by_nome(params[:lista])
			@pergunta.lista=Lista.find(@lista) 
		end 


        if @pergunta.update(params.require(:pergunta).permit(:texto))
            redirect_to :perguntas, notice: "Pergunta #{@pergunta.texto} modificado com sucesso"
        else
          redirect_to  "http://localhost:3000/perguntas/#{@pergunta.id}/edit"
        end
    end

	def destroy
        p = Pergunta.find(params[:id])
        p.destroy
        redirect_to :perguntas, notice: "Pergunta #{p.texto} excluido"
    end
end
