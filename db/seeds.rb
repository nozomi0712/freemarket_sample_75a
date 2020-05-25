User.create(
  nickname: "makonari", 
  email: Faker::Internet.email,
  password: "aaaaaaaa",
  birthday: "2000/03/01",
  first_name: "成",
  first_furigana: "なり",
  last_name: "真子",
  last_furigana: "まこ",
)

UserAddress.create(
  post: "1112111",
  preficture: "東京都",
  city: "渋谷区道玄坂",
  block: "２丁目23-12",
  building: "フォンティスビル7F",
  tell_number: "05031873522",
  user_id: 1,
)

Item.create(
  item_name: "まこなりのバッグ",
  explanation: "１０年間使っていたバッグです。思い出がたくさん詰まっていますが、容量はいっぱい入ると思います。",
  price: 200,
  brand: "MakoStyle",
  condition: "中古",
  user_id: 1,
  ship_date: "1〜2日で発送",
  delivery_fee: "送料込み(出品者負担)",
)

Image.create(
  item_id: 1,
  image: "https://images-na.ssl-images-amazon.com/images/I/61acr0glFHL._AC_UY500_.jpg",
)

