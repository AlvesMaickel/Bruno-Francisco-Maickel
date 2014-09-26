class Usuario < ActiveRecord::Base
  belongs_to :tipo
  
validates :username,uniqueness: true

validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

validates :email,uniqueness: true

validates :tipo,presence: true

validates :username,presence: true

validates :email,presence: true

validates :senha,presence: true

validates :senha, length: 6..12
  
end
