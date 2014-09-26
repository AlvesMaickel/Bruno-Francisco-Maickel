class Pergunta < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :conteudo
  belongs_to :lista
  
validates :usuario,presence: true

validates :texto,presence: true

validates :horario,presence: true

validates :n_respostas,presence: true

validates :respondida,presence: true
end
