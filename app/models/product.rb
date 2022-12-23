class Product < ApplicationRecord
 
	# has_many :product_feedbacks
	# has_many :product_carts
  	# has_many :products, :through => :product_carts

	has_many :carts
	has_many :users, through: :carts

	has_many :product_discounts
	has_many :discounts, through: :product_discounts
	
	belongs_to :product_stock, optional: true
	belongs_to :category, optional: true



	mount_uploader :product_image1, ProductUploader
	mount_uploader :product_image2, ProductUploader
	mount_uploader :product_image3, ProductUploader
	mount_uploader :product_image4, ProductUploader
	mount_uploader :product_image5, ProductUploader

	

end
