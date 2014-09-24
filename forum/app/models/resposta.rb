class Resposta < ActiveRecord::Base
  belongs_to :pergunta
  belongs_to :usuario
end
