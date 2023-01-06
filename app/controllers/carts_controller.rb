class CartsController < ApplicationController
    # before_action :authenticate_admin_user!
    
    before_action :admin, only: [:show, :update, :destroy, :edit]
    skip_before_action :verify_authenticity_token

    
    def cart_index

    end

    # def cart_details
    #     # byebug
    #     @cart_array = []
    #     @product_price = []
    #     user_detail = ProductInformation::CartService.cart_index($session_user)
    #     @cart = ProductInformation::CartService.cart_details(user_detail.unique_id)
         
    #     @cart.each do |x|
    #         @id =  x.product_unique_id
    #         @product = Product.find_by(product_unique_id: @id)   
    #         @cart_price = @product_price.push(@product.product_price).sum
    #         @cart_data = @cart_array.push(@product)
    #         @cart_shipping = 10
    #         @cart_tax = 20
    #         @cart_total = @cart_price + @cart_tax + @cart_shipping

    #     end
    #     render json: [@cart_data,@cart_price,@cart_tax, @cart_total ,@cart_shipping]
    # end

    def product_qauntity
        # byebug
        @quantity = ProductInformation::CartService.product_qauntity(params[:product_unique_id],params[:quantity])  
        redirect_to cart_index_path
    end  
    

    def cart_details
        @product_price = []
        user_detail = ProductInformation::CartService.cart_index($session_user)
        @cart = ProductInformation::CartService.cart_details(user_detail.unique_id)  
        @cart.each do |x|
          
            @cart_total_price = @product_price.push(x.product_price* x.product_quantity).sum
          
        end
        render json: [@cart, @cart_total_price ]
    end


   
    def add_to_cart
        # byebug
        product_detail = ProductInformation::CartService.add_to_cart(params[:product_unique_id], params[:quantity],$session_user)
        redirect_to product_index_path
    end


   

    def delete_cart
        # byebug
        @product_info=ProductInformation::CartService.delete_cart(params[:product_unique_id])
        # redirect_to cart_index_path
    end
 

    # --------------------------------------------------------------------------------------------------

    def wishlist_index

    end


    def wishlist_details
        # byebug
        @wishlist_array = []
        user_detail = ProductInformation::CartService.cart_index($session_user)
        @wishlist = ProductInformation::CartService.wishlist_details(user_detail.unique_id)
         
        @wishlist.each do |x|
            @id =  x.product_unique_id
            @product = Product.find_by(product_unique_id: @id)   
            @wishlist_data = @wishlist_array.push(@product)
        end
        render json: @wishlist_data  
    end

    # def add_to_wishlist
    #     # byebug
    #     product_detail = ProductInformation::ProductService.single_product(params[:product_unique_id])
    #     user_detail = ProductInformation::CartService.cart_index($session_user)
    #     @cart = ProductInformation::CartService.add_to_wishlist(product_detail.product_unique_id,user_detail.unique_id)
    #     redirect_to product_index_path
    # end

    def add_to_wishlist
        # byebug
        product_detail = ProductInformation::CartService.add_to_wishlist(params[:product_unique_id], params[:quantity],$session_user)
        redirect_to product_index_path
    end

  

    def delete_wishlist
        # byebug
        product = ProductInformation::CartService.delete_wishlist(params[:product_unique_id])
        redirect_to wishlist_index_path
    end


    # ========================================================================================================
   

    def new_pay
        # byebug
    end

    def create_pay
        # byebug
        @amount = 500

        customer = Stripe::Customer.create(email: params[:stripeEmail], source: params[:stripeToken])
       charge = Stripe::PaymentIntent.create(:customer => customer.id, :amount => @amount, :description => 'Rails Stripe transaction',:currency => 'usd')
         rescue Stripe::CardError => e
           flash[:error] = e.message
        #  redirect_to new_charge_path 
        redirect_to order_index_path
    end



    def create_cart
        # byebug
        @data = ProductInformation::CartService.create_cart(cart_params)
		head :no_content
    end

   
   
    private

    def cart_params
		# params.require(:cart).permit(:product_description, :product_image1, :product_price, :product_quantity, :user_unique_id, :product_unique_id)
        byebug
        params.permit(:cart)
	end

    
end
