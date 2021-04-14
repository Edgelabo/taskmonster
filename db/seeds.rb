# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Monster.create!(
   name: 'ボーボ',
   image: 'bobo.gif'
)
Monster.create!(
   name: 'ネチョー',
   image: 'netyo.gif'
)
Monster.create!(
   name: 'コロロ',
   image: 'kororo.gif'
)

Encourage.create!(comment: '時には休むことも大切だよ〜')
Encourage.create!(comment: '今日もがんばっていこう！')
Encourage.create!(comment: 'どんどんタスクこなしていっちゃおう！')
Encourage.create!(comment: 'タスクをこなしてもっと成長させて！')