class OrderMailer < ApplicationMailer

  def welcome_email
    mail(to: "sigmatconsultancy@gmail.com", subject: "Welcome to My Awesome Site")
  end
end




