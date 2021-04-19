FactoryBot.define do
  factory :user do
    nickname              {"森もりモリ"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"森川"}
    first_name            {"浩佑"}
    last_name_kana        {"モリカワ"}
    first_name_kana       {"コウスケ"}
    birth_date            {Faker::Date.birthday}
  end
end