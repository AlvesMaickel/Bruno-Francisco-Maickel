# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tipo.create nome:'aluno'
Tipo.create nome:'admin'
Usuario.create tipo:Tipo.find_by_id(1),username:'francisco',email:'francisco_neto_96@hotmail.com',senha:'ashrewert'