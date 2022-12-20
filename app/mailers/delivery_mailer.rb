class DeliveryMailer < ApplicationMailer
	 default from: 'sigmatconsultancy@gmail.com'

  def invoice_email
    @data = params[:data]
    mail(to: "manjusathyam842@gmail.com", subject: "Welcome to My Awesome Site")
  end
end
