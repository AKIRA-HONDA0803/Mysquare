FactoryBot.define do
  factory :square do
    title { Faker::Lorem.characters(number:5) }
    description { Faker::Lorem.characters(number: 6) }
    # ↓外部キーは新たにFactoryBotで作成する/モデルも作成
    category { FactoryBot.create(:category) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no_image.jpg')) }

  end
end