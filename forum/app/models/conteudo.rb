class Conteudo < ActiveRecord::Base
validates :bimestre, inclusion: { in: 1..4 }

validates :nome, length: { maximum: 29 }

validates :nome,uniqueness: true

validates :nome,presence: true

validates :arquivo,presence: true

validates :bimestre,presence: true
end
