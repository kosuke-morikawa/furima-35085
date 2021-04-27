FactoryBot.define do
  factory :order_destination do
    postal_code { '000-0000' }
    prefecture_id { 3 }
    city { '東区' }
    addresses { '泉1-1-10' }
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
    building { 'マンション名' }
  end
end