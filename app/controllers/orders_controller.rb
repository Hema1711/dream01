class OrdersController < ApplicationController
	 skip_before_action :verify_authenticity_token
	def get_order
		@data=ProductInformation::OrderService.get_order
		render :json =>  @data
	end

	def order_index
		# byebug
		user_detail = ProductInformation::CartService.cart_index($session_user)
		order_products = Cart.find_by(cart_unique_id: user_detail.cart_unique_id)

	end

	def delivery_index
		# byebug
		user_detail = ProductInformation::CartService.cart_index($session_user)
		order_products = Cart.find_by(cart_unique_id: user_detail.cart_unique_id)

	end


	def new_order
		@data=ProductInformation::OrderService.new_order
	end
	
	def edit_order
		@data=ProductInformation::OrderService.edit_order(order_id)
	end

	def update_order
		@data=ProductInformation::OrderService.update_order(order_id,params)
	end

	def create_order
		byebug
		@order = ProductInformation::OrderService.create_order(order_params)
		head :no_content
	end

	def delete_order
		@data=ProductInformation::OrderService.delete_order(order_id)
	end

	def download
		# byebug
		pdf = Prawn::Document.new
		pdf.text "haiiii"
		send_data(pdf.render, filename: "#{@order}.pdf", type: "application/pdf")
	  end

	private
	
	def order_params
		# params.require(:order).permit(:user_id, :total, :cart_id, :payment_id, :quantity)
		params.permit(:order)
	end
end



