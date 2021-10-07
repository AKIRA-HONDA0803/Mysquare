# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
      name: 'お金'
  )

Category.create!(
      name: '仕事'
  )

Category.create!(
      name: '知識・経験'
  )

Category.create!(
      name: '家族'
  )

Category.create!(
      name: '人間関係'
  )

Category.create!(
      name: '身体'
  )

Category.create!(
      name: '心・在り方'
  )

Category.create!(
      name: 'その他'
  )

Square.create!(
  title: "シンガポールに行く",
  description: "テスト１",
  user_id: 1,
  category_id: 3,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square1.jpg")
  )

Square.create!(
  title: "ロールスロイスに乗る",
  description: "テスト２",
  user_id: 1,
  category_id: 1,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square2.jpg")
  )

Square.create!(
  title: "バンジージャンプする",
  description: "テスト3",
  user_id: 1,
  category_id: 3,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square3.jpg")
  )
Square.create!(
  title: "世界一周する",
  description: "テスト4",
  user_id: 1,
  category_id: 3,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square4.jpg")
  )
Square.create!(
  title: "家族と幸せに暮らす",
  description: "テスト5",
  user_id: 1,
  category_id: 4,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square5.jpg")
  )

Square.create!(
  title: "健康に暮らす",
  description: "テスト6",
  user_id: 1,
  category_id: 6,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square6.jpg")
  )
Square.create!(
  title: "エンジニアになる",
  description: "テスト7",
  user_id: 1,
  category_id: 7,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square7.jpg")
  )
Square.create!(
  title: "「ありがとう」を当たり前にする",
  description: "テスト8",
  user_id: 1,
  category_id: 7,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square8.jpg")
  )
Square.create!(
  title: "仲間と共に切磋琢磨する",
  description: "テスト9",
  user_id: 1,
  category_id: 5,
  is_completed: false,
  is_released: false,
  image: File.open("./app/assets/images/square9.jpg")
  )

User.create!(
  name: "サンプル",
  introduction: "サンプル",
  email: "test@test.co.jp",
  password: "testtest",
  profile_image: File.open("./app/assets/images/sample.jpg")
  )