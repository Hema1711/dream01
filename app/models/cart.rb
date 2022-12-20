class Cart < ApplicationRecord
    has_many :product_carts
    has_many :carts, :through => :product_carts

    
    has_one :cart_log
    belongs_to :user, optional: true
    has_one :order
end
