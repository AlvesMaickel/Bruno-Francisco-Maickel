# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tipo.create nome:'aluno'
Tipo.create nome:'admin'

Senha = Digest::MD5.hexdigest('admin')  
Usuario.create tipo:Tipo.find_by_id(1),username:'admin',email:'admin@gmail.com',senha: Senha