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
    #     if !session[:order_id].nil?
    #         Order.find(session[:order_id])
    #     else
    #         if !user_signed_in?
    #             Order.new
    #         else
    #             current_user.build_order
    #         end
    #     end
    # end
    
    def current_order
        if session[:order_id].nil? && user_signed_in? && current_user.orders != []
            #if there is no cart and the user is logged in and user already has a current cart
            Order.find(session[:order_id] = current_user.orders.last.id)
    
        elsif !session[:order_id].nil? && user_signed_in? && current_user.orders != [] && current_user.orders.last.id != session[:order_id]
            #if there is a current cart and the user is logged in and the user already has a cart and the id of his cart is different from the id of the session
            current_user.orders.last.order_items += Order.find(session[:order_id]).order_items
            Order.find(session[:order_id]).destroy!
            Order.find(session[:order_id] = current_user.orders.last.id)
    
        elsif !session[:order_id].nil? && user_signed_in? && current_user.orders == [] && Order.find(session[:order_id]).user_id.nil?
            #if there is a current cart and the user is logged in and the user has no cart and the cart does not have user_id
            pan = Order.find(session[:order_id])
            pan.user_id = current_user.id
            pan.save
            Order.find(session[:order_id])
    
        elsif !session[:order_id].nil?
            #if there is no user login but there is a cart
            Order.find(session[:order_id])
        else
            Order.new
        end
    end

    
end
