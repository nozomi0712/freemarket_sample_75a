FactoryBot.define do
  factory :user do
    nickname               {"のぶ"}
    email                  {"test@test.com"}
    password               {"aaaaaaaa"}
    password_confirmation  {"aaaaaaaa"}
    birthday               {"2020/02/02"}
    first_name             {"金澤"}
    first_furigana         {"カナザワ"}
    last_name              {"伸行"}
    last_furigana          {"ノブユキ"}
  end
end
