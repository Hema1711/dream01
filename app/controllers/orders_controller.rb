class OrdersController < ApplicationController
	 skip_before_action :verify_authenticity_token
	def get_order
		@data=ProductInformation::OrderService.get_order
		render :json =>  @data
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

	private
	
	def order_params
		params.require(:order).permit(:user_id, :total, :cart_id, :payment_id, :quantity)
	end
end



