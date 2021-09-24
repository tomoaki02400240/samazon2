class ShoppingCartItem < ApplicationRecord
  acts_as_shopping_cart_item

  def tax_pct
    0
  end

  scope :user_cart_items, -> (user_shoppingcart) {
    where(owner_id: user_shoppingcart)
  }

  scope :user_cart_item_ids, -> (shopping_cart){
    where(owner_id: shopping_cart).pluck(:id)
  }
end
