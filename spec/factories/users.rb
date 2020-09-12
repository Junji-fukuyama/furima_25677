FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.email }
    string = Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)
    password { string }
    password_confirmation { password }
    first_name { Gimei.last.kanji }
    last_name { Gimei.first.kanji }
    first_name_kana { Gimei.last.katakana }
    last_name_kana { Gimei.first.katakana }
    birth_date { Faker::Date.in_date_period(year: 2000) }
  end
end 