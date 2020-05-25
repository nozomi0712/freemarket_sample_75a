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
  ship_date: "2000/05/30",
  delivery_fee: 500,
)

Image.create(
  item_id: 1,
  image: "https://www.google.com/aclk?sa=l&ai=DChcSEwi90vfs6sHpAhVM2JYKHXbSCoYYABAEGgJ0bA&sig=AOD64_2MQrKVP-x7-Mq0rfNWqH9vDS-DoA&adurl&ctype=5&ved=2ahUKEwjdru7s6sHpAhUJ1JQKHWt8B4kQvhd6BQgBEPAB",
)

