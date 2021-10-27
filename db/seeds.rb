# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
9.times do |n|
  sample_name = Gimei.kanji
  sample_email = Faker::Internet.email
  User.create!(
    name:         sample_name,
    email:        sample_email,
    password: "testtest"
  )
end


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
  description: "マリーナベイサンズのプールに入る。マーライオンと写真を撮る。",
  user_id: 1,
  category_id: 3,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square1.jpg")
  )

Square.create!(
  title: "ロールスロイスに乗る",
  description: "ロールスロイスでニューヨークの街をドライブする。",
  user_id: 2,
  category_id: 1,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square2.jpg")
  )

Square.create!(
  title: "バンジージャンプする",
  description: "バンジージャンプして擬似的に空を舞う。",
  user_id: 3,
  category_id: 3,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square3.jpg")
  )
Square.create!(
  title: "世界一周する",
  description: "世界一周をして、異文化を学ぶ。",
  user_id: 4,
  category_id: 3,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square4.jpg")
  )
Square.create!(
  title: "家族と幸せに暮らす",
  description: "家族を大切にして、プライベートを充実させる。",
  user_id: 5,
  category_id: 4,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square5.jpg")
  )

Square.create!(
  title: "健康に暮らす",
  description: "適度な運動をして、病気のない健康的な暮らしをする。",
  user_id: 6,
  category_id: 6,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square6.jpg")
  )
Square.create!(
  title: "エンジニアになる",
  description: "エンジニアになって、生活が豊かになるサービスを作る。",
  user_id: 7,
  category_id: 7,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square7.jpg")
  )
Square.create!(
  title: "「ありがとう」を当たり前にする",
  description: "常に感謝の気持ちを忘れずに生活する。",
  user_id: 8,
  category_id: 7,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square8.jpg")
  )
Square.create!(
  title: "仲間と共に切磋琢磨する",
  description: "良きライバルとお互いを高め合う。",
  user_id: 8,
  category_id: 5,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square9.jpg")
  )

Square.create!(
  title: "高級万年筆を手に入れる",
  description: "書き心地がいい万年筆を使って、知人に手紙を書く。",
  user_id: 2,
  category_id: 1,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square10.jpg")
  )

Square.create!(
  title: "ダイビングする",
  description: "ダイビングをして海の底の生物と触れ合う。",
  user_id: 3,
  category_id: 1,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square11.jpg")
  )
Square.create!(
  title: "医者になる",
  description: "医者になって、難病の人たちの命を救う。",
  user_id: 4,
  category_id: 2,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square12.jpg")
  )

Square.create!(
  title: "本を執筆する",
  description: "自伝を執筆して、世の中の人々の役に立つ。",
  user_id: 1,
  category_id: 3,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square15.jpg")
  )
Square.create!(
  title: "警察官になる",
  description: "警察官になって、市民の安全を守るまちづくりをする",
  user_id: 1,
  category_id: 2,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square13.jpg")
  )
Square.create!(
  title: "外国の友人がいる",
  description: "世界中に国籍が違う友人がいて、連絡を取れる。",
  user_id: 1,
  category_id: 5,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square16.jpg")
  )

Square.create!(
  title: "常に笑って過ごす",
  description: "どんなときも笑顔を忘れずに過ごす。",
  user_id: 1,
  category_id: 7,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square17.jpg")
  )
Square.create!(
  title: "引き締まった体を維持する",
  description: "トレーニングを欠かさず行い、いつまでも若さを保つ。",
  user_id: 1,
  category_id: 6,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square18.jpg")
  )
Square.create!(
  title: "孫の結婚式に参加する",
  description: "孫の結婚式に参加するために、長生きする。",
  user_id: 7,
  category_id: 4,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square19.jpg")
  )
Square.create!(
  title: "親孝行する",
  description: "両親に親孝行することで、感謝を伝える。",
  user_id: 8,
  category_id: 4,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square20.jpg")
  )
Square.create!(
  title: "チワワを飼う",
  description: "チワワを家族として迎え入れて、可愛がる。",
  user_id: 8,
  category_id: 4,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square21.jpg")
  )
Square.create!(
  title: "Mac Bookを買う",
  description: "Mac Bookを手に入れて、スターバックスで仕事する。",
  user_id: 5,
  category_id: 1,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square22.jpg")
  )
Square.create!(
  title: "リムジンに乗る",
  description: "リムジンを貸し切って、リムジンパーティーをする。",
  user_id: 8,
  category_id: 3,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square23.jpg")
  )
Square.create!(
  title: "10歳若く見られる",
  description: "年齢よりも若く見られるように、アンチエイジングに力を入れる。",
  user_id: 8,
  category_id: 6,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square24.jpg")
  )
Square.create!(
  title: "一緒に仕事する仲間に恵まれる",
  description: "同じ志を持ったビジネス仲間と夢や目標を語る",
  user_id: 6,
  category_id: 5,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square25.jpg")
  )
Square.create!(
  title: "バンドマンになる",
  description: "バンドを組んでギターボーカルを務め、全国ツアーを開催する。",
  user_id: 5,
  category_id: 2,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square26.jpg")
  )
Square.create!(
  title: "ワインを嗜む",
  description: "ワインを嗜み、効きワインができるようになる。",
  user_id: 4,
  category_id: 2,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square27.jpg")
  )

Square.create!(
  title: "数学教師になる",
  description: "数学教師になって、子供たちの数学嫌いをなくす。",
  user_id: 1,
  category_id: 2,
  is_completed: false,
  is_released: true,
  image: File.open("./app/assets/images/square14.jpg")
  )
9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+19}",
    position: "#{n+1}",
    user_id: 1,
  )
end
DeckRecipe.create!(
  user_id: 1,
  is_released: true,
  theme: "ハチャメチャ数学教師",
  )

9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+1}",
    position: "#{n+1}",
    user_id: 2,
  )
end
DeckRecipe.create!(
  user_id: 2,
  is_released: true,
  theme: "シリコンバレーエンジニア",
  )
9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+9}",
    position: "#{n+1}",
    user_id: 3,
  )
end
DeckRecipe.create!(
  user_id: 3,
  is_released: true,
  theme: "世界的名医",
  )
9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+13}",
    position: "#{n+1}",
    user_id: 4,
  )
end
DeckRecipe.create!(
  user_id: 4,
  is_released: true,
  theme: "全てが愛に溢れる",
  )
9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+15}",
    position: "#{n+1}",
    user_id: 5,
  )
end
DeckRecipe.create!(
  user_id: 5,
  is_released: true,
  theme: "常に今が一番若い!",
  )
9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+18}",
    position: "#{n+1}",
    user_id: 6,
  )
end
DeckRecipe.create!(
  user_id: 6,
  is_released: true,
  theme: "ええ感じのバンドマン",
  )
9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+4}",
    position: "#{n+1}",
    user_id: 7,
  )
end
DeckRecipe.create!(
  user_id: 7,
  is_released: true,
  theme: "ロボットドクター",
  )
9.times do |n|
  DeckSquare.create!(
    square_id: "#{n+17}",
    position: "#{n+1}",
    user_id: 8,
  )
end
DeckRecipe.create!(
  user_id: 8,
  is_released: true,
  theme: "チワワ飼う系ギターボーカル",
  )