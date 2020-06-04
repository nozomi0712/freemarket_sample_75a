class Brand < ActiveHash::Base
  self.data = [
    {id: 1, brand: "Apple"},
    {id: 2, brand: "Dell"},
    {id: 3, brand: "Sony"},
    {id: 4, brand: "Bose"},
    {id: 5, brand: "Beats"}
  ]
end