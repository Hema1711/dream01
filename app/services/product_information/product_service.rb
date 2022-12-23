module ProductInformation
	class ProductService

		def self.get_products(load_count,search_text="")
			product = Product.where("product_name LIKE ?" ,"#{search_text}%")
		end

		def self.single_product(product_unique_id)
			# byebug
			product = Product.find_by(product_unique_id: product_unique_id)
		end

		def self.new_product
			product = Product.new 
		end

		def self.edit_product(product_unique_id)
			# byebug
			product = Product.find_by(product_unique_id: product_unique_id)
		end

		def self.update_product(product_unique_id, params)
			# byebug
			product = Product.find_by(product_unique_id: product_unique_id)
			if product.update(params)
				return true
			end
		end

		def self.create_product(params)
			# byebug
			product_unique_id = SecureRandom.alphanumeric(6)
			product = Product.create(product_unique_id: product_unique_id)
			@product = product.update(params)
			
		end

		def self.delete_product(product_unique_id)
			# byebug
			product = Product.find_by(product_unique_id: product_unique_id)
			product.delete
		end
	end
end