module ProductInformation
	class CartService

        def self.cart_index(email_id)
            user_detail= User.find_by(email_id)
        end
        
        def self.cart_details(user_id)
            cart= Cart.where(user_id: user_id).ids
            product = ProductCart.where(cart_id: cart).ids
            pro = ProductCart.find(product)

            # result = Product.find(product)
        end

        def self.create_cart()
            # byebug
            # data = Product.create(params)
        end
        
	end
end