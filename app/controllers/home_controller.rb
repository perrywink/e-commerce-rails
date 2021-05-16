class HomeController < ApplicationController
  def index
    @items = Item.order('popularity DESC').first(4)
    @collections = Collection.first(4)
    
    offset = rand(Item.count)
    @rand_item = Item.offset(offset).first
  end
  
  def newsletter
    email = params[:email]
    NewsletterMailer.signup_confirmation(email).deliver
    redirect_to root_path, flash: { success: "Check your inbox!" }
  end
end
