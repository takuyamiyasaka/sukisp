# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "sukisp@co.jp", password:"sukisuki")
Genre.create(genre_name: "スポーツ")
Genre.create(genre_name: "芸能")
Genre.create(genre_name: "日常")
Genre.create(genre_name: "食事")
Genre.create(genre_name: "時事")
Customer.create(name: "高知雅",public_name:"マサ",email:"masa@com",password:"masanori")
Customer.create(name: "長野健司",public_name:"ナガノ",email:"nagano@com",password:"nagano")
Customer.create(name: "大阪千恵美",public_name:"ppoppo",email:"oosaka@com",password:"oosaka")
Customer.create(name: "北海宗次",public_name:"宗次",email:"spijo@com",password:"souji")
Customer.create(name: "名古屋未来",public_name:"ミク",email:"nagoya@com",password:"pelili")
Customer.create(name: "沖縄雄二",public_name:"yuji",email:"okinawaa@com",password:"okinawa")