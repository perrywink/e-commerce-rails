class NewsletterMailer < ApplicationMailer
  default from: "raindropsfashion1@gmail.com"
  
  def signup_confirmation(email)
    mail to: email, subject: "Signed up to Raindrops Fashion Newsletter!"
  end
end
