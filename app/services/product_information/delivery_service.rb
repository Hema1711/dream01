module ProductInformation
	class DeliveryService

		def self.get_delivery
			data = Delivery.all
		end

		def self.create_delivery()
			byebug
			@data = Delivery.new()
			if @data.save
				DeliveryMailer.invoice_email.deliver

				puts "Payment Delivered Successfully"
			end
		end
	end
end
