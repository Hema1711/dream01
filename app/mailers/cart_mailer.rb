class CartMailer < ApplicationMailer
  def missing_product_email
    byebug
    mail(to: "sigmatconsultancy@gmail.com", subject: "Welcome to My Awesome Site")
  end
end
