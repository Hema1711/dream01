module ProductInformation
	class DeliveryService

		def self.get_delivery
			data = Delivery.all
		end

		def self.create_delivery(params_del)
			byebug
			@data = Delivery.new(params_del)
			if @data.save
				DeliveryMailer.with(data: @data).invoice_email.deliver_now
				puts "Payment Delivered Successfully"
			end
		end
	end
end
