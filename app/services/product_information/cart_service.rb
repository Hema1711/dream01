module ProductInformation
	class CartService

        def self.cart_index(email_id)
            # byebug
            user_detail= User.find_by(email: email_id)
        end
        
        def self.cart_details(unique_id)
            cart =Cart.where(user_unique_id: unique_id)
        end

        def self.add_to_cart(product_unique_id,unique_id)
            # cart_unique_id = SecureRandom.alphanumeric(6)
            @cart_data = Cart.new(product_unique_id:product_unique_id, user_unique_id: unique_id)
            @cart_data.save
            byebug
        end










        # def self.create_cart(cart_params)
        #     byebug
        #     @cart_data = Cart.new(cart_params)
        #     if @cart_data.total_items.present?
        #         CartMailer.with(cart: @cart_data).missing_product_email.deliver_now
        #         puts "you have some products in the cart"
        #     end
        # end
        
	end
end