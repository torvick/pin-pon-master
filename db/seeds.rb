# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: 'prueba_1@mail.com',name:'Victor',last_name: 'Urquides', alias: 'torvick', password: 'holamundo', rating: 0)
User.create!(email: 'prueba_2@mail.com',name:'Guadalupe',last_name: 'Torres', alias: 'Gpe', password: 'holamundo2', rating: 0)
User.create!(email: 'prueba_3@mail.com',name:'Fernando',last_name: 'Morales', alias: 'Fer20', password: 'holamundo3', rating: 0)