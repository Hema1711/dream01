class OrderMailer < ApplicationMailer
	 default from: 'manjusathyam842@gmail.com'

  def welcome_email
    byebug
    @order = params[:order]
    mail(to: "sigmatconsultancy@gmail.com", subject: "Welcome to My Awesome Site")
    # mail(from: 'manjusathyam842@gmail.com', to: 'sigmatconsultancy@gmail.com').deliver
  end
end




