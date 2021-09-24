class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :star_repeat_select, -> {
    {
      "★★★★★" => 5,
      "★★★★" => 4,
      "★★★" => 3,
      "★★" => 2,
      "★" => 1
    }
  }

  
  end
