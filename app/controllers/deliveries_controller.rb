class DeliveriesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def get_delivery
		@data=ProductInformation::DeliveryService.get_delivery
		render :json =>  @data
	end

	def create_delivery
		byebug
		@data = ProductInformation::DeliveryService.create_delivery(params_del)
	end

	private
	
	def params_del
		byebug
		params.require(:delivery).permit(:order_id, :delivery_partner, :delivery_status_id, :cancellation_id)
	end
end
