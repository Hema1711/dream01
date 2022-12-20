class Product < ApplicationRecord
    has_many :product_discounts
	has_many :discounts, through: :product_discounts
	
	belongs_to :product_stock, optional: true
	belongs_to :category, optional: true
	# has_many :product_feedbacks


	has_many :product_carts
  	has_many :products, :through => :product_carts
end
