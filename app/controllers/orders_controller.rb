class OrdersController < ApplicationController
	 skip_before_action :verify_authenticity_token
	def get_order
		@data=ProductInformation::OrderService.get_order
		render :json =>  @data
	end

	def order_index
		# byebug
		user_detail = ProductInformation::CartService.cart_index($session_user)
		# order_products = Cart.find_by(cart_unique_id: user_detail.cart_unique_id) commented

	end

	def delivery_index
		# byebug
		user_detail = ProductInformation::CartService.cart_index($session_user)
		# order_products = Cart.find_by(cart_unique_id: user_detail.cart_unique_id) commented

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
		# begin
        #     pdf_file_path = "#{Rails.root}/public/output"
        #     full_doc = "#{Rails.root}/public/something.png" 
        #     pdf.image full_doc
        #     pdf.start_new_page
        #     pdf.render_file pdf_file_path
        #  rescue Prawn::Errors::UnsupportedImageType
        #     flash[:notice] = "Image unsupported"
        #     redirect_to '/handle'
        #  end
		pdf.text "Hello, Chris
		You Order Has Been Confirmed And Will Be Shipped In Next Two Days!"
		pdf.text "Order Number:171-4432740-8410745"
		pdf.text "Invoice Number:DEL4-71301"
		pdf.text "Order Date:14.03.2018"
		pdf.text "Invoice Details:HR-DEL4-167791461-1718"
		pdf.text "Invoice Date:15.03.2023"
		
		pdf.image "/home/downloads/invoice.jpg"    

		#for mail
		# @data = ProductInformation::DeliveryService.create_delivery()

		send_data pdf.render, filename: "orders.pdf", type: "application/pdf"
	end

	private
	
	def order_params
		# params.require(:order).permit(:user_id, :total, :cart_id, :payment_id, :quantity)
		params.permit(:order)
	end
end



