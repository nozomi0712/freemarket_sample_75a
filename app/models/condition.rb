class Condition < ActiveHash::Base
  self.data = [
    {id: 1, condition: "未開封"},
    {id: 2, condition: "未使用に近い"},
    {id: 3, condition: "仕様に問題なし"},
    {id: 4, condition: "ジャンク品"}
  ]
end