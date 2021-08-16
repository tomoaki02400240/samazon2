require 'faker'

product_ids = [*1..30]
category_ids = [*1..18,*1..12]
array_number = 0

product_ids.each do
  product_name = Faker::Music::RockBand.name 
  Product.create!(
    name: product_name,
    description: product_name,
    price: product_ids[array_number],
    category_id: category_ids[array_number]
  )
  puts "最初の#{array_number}"
  array_number += 1
  puts array_number
end