# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:"Caetano Rei Delas", enrollment:211068666, is_admin:true, is_student:true, is_teacher:true, email:"caetanosocafofo@infiel.com", password:"soudelaseparaelas")
User.create(name:"De sá trepa no C.A", enrollment:211068999, is_admin:true, is_student:true, is_teacher:true, email:"desáinbroxavel@cachorro.com", password:"foguetenãodáré")