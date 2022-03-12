FactoryBot.defind do
  factory :user do
    nickname  {Faker::Name.initials(number: 2)}
    email   {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1)
    password {password}
    password_confirmation {password}
    first_name {"祐介"}
    last_name {"紫田"}
    first_name_kana {"ユウスケ"}
    last_name_kana {"シバタ"}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end