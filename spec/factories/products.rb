FactoryBot.define do
  factory :product do
    name { '商品名' }
    price                  { 300 }
    category_id            { 2 }
    info                   { '商品説明' }
    sales_status_id        { 2 }
    shipping_fee_status_id { 2 }
    scheduled_delivery_id  { 2 }
    prefecture_id          { 2 }
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end