class Pergunta < ActiveRecord::Base
  belongs_to :usuario
  validade :texto,presence: true
end
