module ApplicationHelper
    
    def is_admin?
        current_user && current_user.admin 
    end
    
    def authorized_as_admin
        unless is_admin?
            redirect_to root_path
            flash[:warning] = "You have no permissions to view that page!" 
        end
    end
    
    def current_order
        if !session[:order_id].nil?
            Order.find(session[:order_id])
        else
            Order.new
        end
    end
    
end
