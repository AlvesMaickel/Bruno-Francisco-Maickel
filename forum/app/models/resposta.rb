class Resposta < ActiveRecord::Base
  belongs_to :pergunta
  belongs_to :usuario
  validates :usuario,presence: true

  validates :texto,presence: true

  validates :horario,presence: true

  validates :pergunta,presence: true

  validates :texto,presence: true

  validates :util_s,presence: true

  validates :util_n,presence: true

end
