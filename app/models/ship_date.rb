class ShipDate < ActiveHash::Base
  self.data = [
    {id: 1, ship_date: "2日以内"},
    {id: 2, ship_date: "５日以内"}, 
    {id: 3, ship_date: "１週間以内"},
    {id: 4, ship_date: "購入前相談"}
  ]
end