class HomeController < ApplicationController
  
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  def index
    @items = Item.order('popularity DESC').first(4)
    @collections = Collection.first(4)
    
    offset = rand(Item.count)
    @rand_item = Item.offset(offset).first
  end
  
  def newsletter
    email = params[:email]
    if email
      # If the user is not signed in, they will always be sent a "subscribed" email
      if email.match(EMAIL_FORMAT) && current_user.nil?
        NewsletterMailer.signup_confirmation(email).deliver
        redirect_to root_path, flash: { success: "Check your inbox!" }
      
      # The conditionals below this point deal with when a user is signed in
      elsif email.match(EMAIL_FORMAT) && !current_user.subscribed
        NewsletterMailer.signup_confirmation(email).deliver
        current_user.subscribed = true
        current_user.save
        redirect_back fallback_location: root_path, flash: { success: "Check your inbox!" }
        
      elsif email.match(EMAIL_FORMAT) && current_user.subscribed
        current_user.subscribed = false
        current_user.save
        redirect_back fallback_location: root_path, flash: { success: "Unsubscribed from newsletter!" }
        
      else
        redirect_back fallback_location: root_path, flash: { warning: "Invalid email entered!" }
      end
    end
    
  end
end
