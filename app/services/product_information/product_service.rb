module ProductInformation
	class ProductService

		def self.get_products(load_count,search_text="")
			product = Product.where("product_name LIKE ?" ,"#{search_text}%")
		end

		def self.single_product(product_id)
			product = Product.find(product_id)
		end

		def self.new_product
			product = Product.new 
		end

		def self.edit_product(product_id)
			# byebug
			product = Product.find(product_id)
		end

		def self.update_product(product_id, params)
			product = Product.find(product_id)
			if product.update
				return true
			else
				return false
			end
		end

		def self.create_product(params)
			byebug
			product = Product.create(params)
		end

		def self.delete_product(product_id)
			product = Product.find(product_id)
			product.update(is_active: false)
		end
	end
end