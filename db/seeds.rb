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