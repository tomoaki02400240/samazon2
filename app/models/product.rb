class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  acts_as_likeable

  PER = 15

  #scope :display_list, -> (category, page){
   # if category != "none"
    #  where(category_id: category).page(page).per(PER)
    #else
     # page(page).per(PER)
    #end
 # }

 scope :display_list, -> (page){
   page(page).per(PER)
 }

 scope :category_products, -> (category, page) {
   where(category_id: category.id).page(page).per(PER)
 }

 scope :sort_product, -> (sort_order, page) {
    where(category_id: sort_order[:sort_category]).order(sort_order[:sort]).page(page).per(PER)
 }
  
 scope :sort_list, -> {
    {
    "並び替え" => "",
    "価格の安い順" => "price asc",
    "価格の高い順" => "price desc",
    "出品の古い順" => "updated_at asc",
    "出品の新しい順" => "updated_at desc"
}
  }

scope :in_cart_product_names, -> (cart_user_ids){
  where(id: cart_user_ids).pluck(:name)
}
  
end
