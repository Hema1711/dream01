module ProductInformation
	class DeliveryService

		def self.get_delivery
			data = Delivery.all
		end

		def self.create_delivery(params_del)
			byebug
			@data = Delivery.new(params_del)
			if @data.save
				DeliveryMailer.invoice_email.deliver

				puts "Payment Delivered Successfully"
			end
		end
	end
end
