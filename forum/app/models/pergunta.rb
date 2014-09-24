class Pergunta < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :conteudo
  belongs_to :lista
end
