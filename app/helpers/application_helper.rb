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
    
    # def current_order
    #     # For ongoing order
    #     if session[:order_id].nil? && user_signed_in? && !current_user.orders.empty?
    #         Order.find(session[:order_id] = current_user.orders.last.id)
        
    #     # Merging an old order with a new one
    #     elsif !session[:order_id].nil? && user_signed_in? && !current_user.orders.empty? && current_user.orders.last.id != session[:order_id]
    #         current_user.orders.last.order_items += Order.find(session[:order_id]).order_items
    #         Order.find(session[:order_id]).destroy!
    #         Order.find(session[:order_id] = current_user.orders.last.id)
        
    #     # Deals with the case where we have an anonymous blank order in db
    #     elsif !session[:order_id].nil? && user_signed_in? && current_user.orders.empty? && Order.find(session[:order_id]).user_id.nil?
    #         anon_order = Order.find(session[:order_id])
    #         anon_order.user_id = current_user.id
    #         anon_order.save
    #         Order.find(session[:order_id])
    
    #     elsif !session[:order_id].nil?
    #         Order.find(session[:order_id])
    #     else
    #         # anoymous order
    #         Order.new
    #     end
    # end
    
    def current_order
        if session[:order_id]
            order = Order.find(session[:order_id])
            session[:order_id] = nil if order.purchased_at
        end
        if session[:order_id].nil?
            if user_signed_in? && !current_user.orders.last.purchased_at.nil?
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
