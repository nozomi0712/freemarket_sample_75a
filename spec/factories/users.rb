FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    birthday              {"2020-01-01"}
    first_name            {"山田"}
    first_furigana        {"ヤマダ"}
    last_name             {"太朗"}
    last_furigana         {"タロウ"}
  end
end
