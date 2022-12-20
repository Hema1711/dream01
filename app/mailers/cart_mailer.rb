class CartMailer < ApplicationMailer
	 default from: 'sigmatconsultancy@gmail.com'

  def missing_product_email
    byebug
    @cart_data = params[:cart]
    mail(to: "manjusathyam842@gmail.com", subject: "Welcome to My Awesome Site")
  end
end
