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
product_category = ['マウス', 'キーボード', 'バッテリー']
product_status = ['開発中', '製造中', '製造中止']
product_locations = ['未定', '東京', '深圳', 'バンコク', 'デュッセルドルフ', 'ダラス']
document_category = ['その他文書', 'ビジネスプラン', 'マスタープラン', '製品仕様書', '設計書', '試作報告書', '量産試作報告書', '歩留り評価報告書', '作業手順書', '議事録']
project_status = ['活動中', '一時中止', '終了']
#review_stage = ['Review 1', 'Review 2', 'Review 3']
#review_judge = ['未承認', '承認済']

###departmentsテーブルのデータ作成
#7.times { |i|
#  Department.create!(
#    {id: i+1, name: "#{department_name[i]}", location: locations.sample, description: Faker::Lorem.word }
#  )
#}

###usersテーブルのデータ作成
#14.times { |i|
#  User.create!(
#    { name: "test0#{i+1}",
#      mr_ms: ['Mr.', 'Ms.'].sample,
#      email: "test0#{i+1}@example.com",
#      password: "test0#{i+1}",
#      employee_number: "12345#{i}".to_i}
#  )
#}

###productsテーブルのデータ作成
#7.times { |i|
#  Product.create!(
#    {
#     category: product_category.sample,
#     description: Faker::Lorem.sentence,
#     status: product_status.sample,
#     }
#  )
#}
#Product.all.each { |product|
#  if product.status == '開発中'
#    product.update!(location: product_locations[0])
#  else
#    product.update!(location: ['深圳', 'バンコク', 'ダラス'].sample)
#  end
#}
#unless Product.where(category: 'マウス').count == 0
#  Product.where(category: 'マウス').each { |product|
#    product.update(name: "#{Faker::Lorem.word}マウス")
#  }
#end
#unless Product.where(category: 'キーボード').count == 0
#  Product.where(category: 'キーボード').each { |product|
#    product.update(name: "#{Faker::Lorem.word}キーボード")
#  }
#end
#unless Product.where(category: 'バッテリー').count == 0
#  Product.where(category: 'バッテリー').each { |product|
#    product.update(name: "#{Faker::Lorem.word}バッテリー")
#  }
#end

###documentsのseedデータ作成。Productそれぞれについて、文書を作っていく。下記は "製造中"と”製造中止”のみ作成。
#Product.all.each { |product|
#  case product.status
#    when "製造中" then
#      for element in document_category
#        Document.create!(
#          {
#            product_id: product.id,
#            user_id: User.all.sample.id,
#            category: element,
#            authorize: true,
#            title: "#{product.name}#{element}",
#            content: "test",
#          }
#        )
#      end
#    when "製造中止" then
#      for element in document_category
#        Document.create!(
#          {
#            product_id: product.id,
#            user_id: User.all.sample.id,
#            category: element,
#            authorize: true,
#            title: "#{product.name}#{element}",
#            content: "test",
#          }
#        )
#      end
#  end
#}

###projectのシードデータ。productごとにprojectを作っていく。
#for element in Product.all
#  pj = Project.create!(
#    product_id: element.id,
#    name: "#{element.name}開発プロジェクト",
#    description: "テストデータ",
#  )
#  if element.status == "開発中"
#    pj.update(status: "活動中")
#  else
#    pj.update(status: "終了")
#  end
#end

###Reviewのシードデータ。product-project と product-review の アソシエーションを使って、seedデータを作っていく。開発済のproductのみ作成。
#for element in Product.where.not(status: '開発中')
#  dr1 = Review.create!(
#    project_id: element.projects[0].id,
#    product_id: element.id,
#    requester: User.all.sample.id,
#    stage: "Review 1",
#    description: "#{element.name}のDR1",
#    judge: '承認済',
#    comment: "テストデータ",
#  )
#  dr2 = Review.create!(
#    project_id: element.projects[0].id,
#    product_id: element.id,
#    requester: User.all.sample.id,
#    stage: "Review 2",
#    former_review: dr1.id,
#    description: "#{element.name}のDR2",
#    judge: '承認済',
#    comment: "テストデータ",
#  )
#  dr3 = Review.create!(
#    project_id: element.projects[0].id,
#    product_id: element.id,
#    requester: User.all.sample.id,
#    stage: "Review 3",
#    former_review: dr2.id,
#    description: "#{element.name}のDR3",
#    judge: '承認済',
#    comment: "テストデータ",
#  )
#end

###DepartmentとUserの中間テーブルのseedデータ作成
#for element in User.all
#  Member.create!(department_id: 1+(element.id)%7, user_id: element.id)
#end

###project_usersテーブルのseedデータ作成。projectごとにuserをアサインしていく。
#for element in Project.all
#  for department in ["企画課", "営業課", "開発課", "製造課"] #課ではなく、部の方が良い気がする。
#    user = Department.find_by(name: "#{department}").member_users.sample
#    user.project_users.create!(project_id: element.id)
#  end
#end

###reviewとuserの中間テーブル reviewersテーブルのseedデータ作成。開発完了の製品のreviewだけseedで作る。
#developed_product_reviews = []
#for element in Product.where.not(status: "開発中")
#  developed_product_reviews = developed_product_reviews + element.reviews.to_a
#end
#
#for element in developed_product_reviews
#  case element.stage
#    when "Review 1" then
#      user = Department.find_by(name: "開発課").member_users.sample
#      user.reviewers.create!(review_id: element.id)
#    when "Review 2" then
#      user = Department.find_by(name: "製造課").member_users.sample
#      user.reviewers.create!(review_id: element.id)
#    when "Review 3" then
#      user = Department.find_by(name: "営業課").member_users.sample
#      user.reviewers.create!(review_id: element.id)
#  end
#end
