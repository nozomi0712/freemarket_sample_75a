FactoryBot.define do
  factory :user_address do
    post                  {"2001111"}
    preficture            {"東京都"}
    city                  {"東京都"}
    block                 {"渋谷区"}
    building              {"フォンティスビル"}
    tell_number           {"08000000000"}
    first_name            {"佐藤"}
    first_furigana        {"サトウ"}
    last_name             {"勝"}
    last_furigana         {"マサル"}
  end
end
