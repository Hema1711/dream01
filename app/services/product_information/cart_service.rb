module ProductInformation
	class CartService

        def self.cart_index(email_id)
            # byebug
            user_detail= User.find_by(email: email_id)
        end
        
        def self.cart_details(unique_id)
            cart =Cart.where(is_active: true).where(user_unique_id: unique_id)
        end

        def self.add_to_cart(product_unique_id,quantity,email_id)
            # byebug
            product_data = Product.find_by(product_unique_id: product_unique_id)
            user_data = User.find_by(email:email_id)
            @cart_data = Cart.new(product_description: product_data.product_description, product_image1:product_data.product_image1 ,product_name:product_data.product_name, 
                product_price:product_data.product_price  ,product_quantity:quantity ,
                 product_unique_id:product_data.product_unique_id, user_unique_id: user_data.unique_id, cart_unique_id: user_data.cart_unique_id)
            @cart_data.save
           
        end

     

        def self.delete_cart(product_unique_id)
        # byebug
            product = Cart.find_by(product_unique_id: product_unique_id)
            product.update(is_active: false)
        end

        def self.product_qauntity(product_unique_id,quantity)
            # byebug
            product = Cart.find_by(product_unique_id: product_unique_id)
            product.update(product_quantity: quantity)
        end

        # =========================================================================================

    
        

        def self.wishlist_details(unique_id)
            cart =Wishlist.where(is_active: true).where(user_unique_id: unique_id)
        end


        def self.delete_wishlist(product_unique_id)
            # byebug
            product = Wishlist.where(is_active: true).find_by(product_unique_id: product_unique_id)
            product..update(is_active:false)
        end

        def self.add_to_wishlist(product_unique_id,quantity,email_id)
            product_data = Product.find_by(product_unique_id: product_unique_id)
            user_data = User.find_by(email:email_id)
            @cart_data = Wishlist.new(product_description: product_data.product_description, product_image1:product_data.product_image1 ,product_name:product_data.product_name,  product_price:product_data.product_price  ,product_quantity:quantity , product_unique_id:product_data.product_unique_id, user_unique_id: user_data.unique_id)
            @cart_data.save
        end


        def self.create_cart(cart_params)
			byebug
			@cart_data = Cart.new(cart_params)
			if @cart_data.product_quantity.present?
				CartMailer.missing_product_email.deliver

				puts "you have some products in the cart"
			end
		end
        
	end
end