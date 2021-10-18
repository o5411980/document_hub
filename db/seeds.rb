# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
i = 0
locations = ["東京", "深圳", "バンコク", "デュッセルドルフ", "ダラス", "その他"]
department_name = ["所属未定", "管理課", "企画課", "営業課", "製造課", "開発課", "その他"]

#7.times { |i|
#  Department.create!(
#    {id: i+1, name: "#{department_name[i]}", location: locations.sample, description: Faker::Lorem.word }
#  )
#}

7.times { |i|
  User.create!(
    { name: "test0#{i+1}",
      mr_ms: ['Mr.', 'Ms.'].sample,
      email: "test0#{i+1}@example.com",
      password: "test0#{i+1}",
      employee_number: "12345#{i}".to_i}
  )
}
