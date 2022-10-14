# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'test@test.com',
   password: 'asdasd'
)

Customer.create!(
   email: 'test@test.com',
   last_name: '田中',
   first_name: '太郎',
   last_name_kana: 'タナカ',
   first_name_kana: 'タロウ',
   postal_code: '111111',
   address: '地球',
   telephone_number: '112112112',
   password: 'asdasd'
   
)

# encrypted_passwordはseedではpasswordで書く