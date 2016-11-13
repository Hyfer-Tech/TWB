class TagsList < ActiveRecord::Base
  TAG_TYPES = {
    "Mineral Products" => "Mineral Products",
    "Wood Products" => "Wood Products",
    "Metals" => "Metals",
    "Stone and Glass" => "Stone and Glass",
    "Animal and Vegetable Bi-Products" => "Animal and Vegetable Bi-Products",
    "Paper Goods" => "Paper Goods",
    "Vegetable Products" => "Vegetable Products",
    "Animal Products" => "Animal Products",
    "Foodstuffs" => "Foodstuffs",
    "Weapons" => "Weapons",
    "Footwear and Headwear" => "Footwear and Headwear",
    "Animal Hides" => "Animal Hides",
    "Textiles" => "Textiles",
    "Transportation" => "Transportation",
    "Machines" => "Machines",
    "Arts and Antiques" => "Arts and Antiques",
    "Precious Metals" => "Precious Metals",
    "Chemical Products" => "Chemical Products",
    "Instruments" => "Instruments",
    "Plastics and Rubbers" => "Plastics and Rubbers",
    "Miscellaneous" => "Miscellaneous"
  }
end