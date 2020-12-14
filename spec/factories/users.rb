FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    last_name_chinese_characters {"山田"}
    first_name_chinese_characters {"太郎"}
    last_name_katakana {"ヤマダ"}
    first_name_katakana {"タロウ"}
    birthday {Faker::Date.birthday}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {"hoge12"}
    password_confirmation {"hoge12"}
  end
end