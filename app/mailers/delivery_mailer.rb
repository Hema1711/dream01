class DeliveryMailer < ApplicationMailer

  def invoice_email
    mail(to: "sigmatconsultancy@gmail.com", subject: "Welcome to My Awesome Site")
  end
end
