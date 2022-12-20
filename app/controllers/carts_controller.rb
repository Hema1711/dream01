class CartsController < ApplicationController
    before_action :admin, only: [:show, :update, :destroy, :edit]
    skip_before_action :verify_authenticity_token

    def cart_index

    end

    def cart_details()
        
        user_detail = ProductInformation::CartService.cart_index($session_user)
        @cart = ProductInformation::CartService.cart_details(user_detail.id)
        byebug
        render json: @cart
    end
   
    def get_cart
        redirect_to '/carts/get_cart/'
    end


    def create_cart
        # byebug
        product_detail = ProductInformation::ProductService.single_product(params[:id].to_i)
        user_detail = ProductInformation::CartService.cart_index($session_user)

        @cart = Cart.new(product_id: product_detail.id,currency: product_detail.price,user_id: user_detail.id )
        if @cart.save
            redirect_to cart_index_path
        end
    end

    # def create_cart
    #     @data = ProductInformation::CartService.create_cart(cart_params)
    #     head :no_content
    # end
 

    def cart_param
		params.require(:cart).permit(:product_id, :total_items, :sub_total, :total_unique_items, :available_discounts, :currency, :user_id)
	end
end
