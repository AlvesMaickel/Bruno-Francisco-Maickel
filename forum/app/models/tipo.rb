class Tipo < ActiveRecord::Base
validates :nome,presence: true

validates :nome,uniqueness: true
end
