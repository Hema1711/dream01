class CartsController < ApplicationController
    before_action :admin, only: [:show, :update, :destroy, :edit]
    skip_before_action :verify_authenticity_token

    def cart_index

    end

    def cart_details
        # byebug
        @cart_array = []
        user_detail = ProductInformation::CartService.cart_index($session_user)
        @cart = ProductInformation::CartService.cart_details(user_detail.unique_id)
         
        @cart.each do |x|
            @id =  x.product_unique_id
            @product = Product.find_by(product_unique_id: @id)   
            @cart_data = @cart_array.push(@product)
        end
        render json: @cart_data
    end
   
 

    def create_cart
        byebug
        product_detail = ProductInformation::ProductService.single_product(params[:product_unique_id])
        user_detail = ProductInformation::CartService.cart_index($session_user)
        @cart = ProductInformation::CartService.add_to_cart(product_detail.product_unique_id,user_detail.unique_id)
        redirect_to cart_index_path
    end

    def add_to_wishlist
        
    end




    def cart_param
		params.require(:cart).permit(:user_unique_id, :product_unique_id)
	end
end
