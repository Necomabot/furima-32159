FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    last_name_chinese_characters {Faker::Name.last_name}
    first_name_chinese_characters {Faker::Name.first_name}
    last_name_katakana {Faker::Name.last_name}
    first_name_katakana {Faker::Name.first_name}
    birthday {Faker::Date.birthday}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end