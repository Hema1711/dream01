class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
	before_action :admin, only: [:show, :update, :destroy, :edit]
	def index
		@data=Product.all
	end

	def product_details
		@data = ProductInformation::ProductService.get_products(params[:load_count].to_i,params[:search_text])	
		render json: @data
	end

	def featured_product
		@featured_product = Product.last
		render json: @featured_product
	end

	def single_product
		@single_product = ProductInformation::ProductService.single_product(params[:id].to_i)
		# render json: @single_product
	end

	def new_product
		@product_info=ProductInformation::ProductService.new_product
	end

	def create_product
		byebug
		@product_info = ProductInformation::ProductService.create_product(parameters)
		if @data.save
			puts "Saved"
		end
	end
	
	def edit_product
		@product_info=ProductInformation::ProductService.edit_product(params[:id].to_i)
	end

	def update_product
		@product_info=ProductInformation::ProductService.update_product(product_id,parameters)
	end



	def delete_product
		@data=ProductInformation::ProductService.delete_product(product_id)
	end

	private
	
	def parameters
		params.require(:product).permit(:product_name, :product_code, :category_id, :product_stock_id, :product_image, :price, :quantity)
	end
end
