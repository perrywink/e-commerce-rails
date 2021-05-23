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
        if session[:order_id]
            order = Order.find(session[:order_id])
            
            if order.user_id.nil? && user_signed_in?
                if !current_user.orders.empty? && !current_user.orders.last.purchased_at 
                    #last_user_order is ongoing
                    order.order_items += current_user.orders.last.order_items
                    current_user.orders.last.destroy
                    
                end
                order.user_id = current_user.id
                order.save
            end
            
            session[:order_id] = nil if order.purchased_at
        end
        if session[:order_id].nil?
            if user_signed_in?  && (current_user.orders.empty? || !current_user.orders.last.purchased_at.nil? )
                order = current_user.orders.build
                session[:order_id] = order.id
                
            elsif user_signed_in? && current_user.orders.last.purchased_at.nil?
                order = current_user.orders.last
                session[:order_id] = order.id
      
            else
                order = Order.new
            end
        end

        order    
    end
    

    
end
