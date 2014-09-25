class Lista < ActiveRecord::Base
  belongs_to :conteudo
  validates :arquivo,uniqueness: true

  validates :nome,presence: true

  validates :conteudo,presence: true

  validates :arquivo,presence: true
end
