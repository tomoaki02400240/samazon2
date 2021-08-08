# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category_tables = %w(category)

category_tables.each do |cate|
  path = Rails.root.join("db","seed","#{cate}.rb")
  if cate.present?
    puts "#{cate} create ..."
    require(path)
  end
end