class Resposta < ActiveRecord::Base
  belongs_to :pergunta
  validade :texto,presence: true
end
