class Category < ApplicationRecord
  has_many :products
  #scope :request_category, -> (category){
   # if category != "none"
    #  find(category)
    #else
     # ""
    #end
  #}

  scope :request_category, -> (category) {
    find(category)
  }
end
