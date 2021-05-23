# This does not override Devise but simply supplements some additional behaviour
class UsersController < ApplicationController
  
  def set_subscription
    
    if current_user.subscribed
      current_user.update_attributes(subscribed: false)
      redirect_back fallback_location: root_path, flash: { success: "Unsubscribed!" }
    else
      current_user.update_attributes(subscribed: true)
      redirect_back fallback_location: root_path, flash: { success: "Subscribed!" }
    end
      
  end
  
end
