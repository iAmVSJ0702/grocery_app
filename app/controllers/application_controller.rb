class ApplicationController < ActionController::Base
    #before_action :set_current_user
    before_action :set_render_cart

    def set_render_cart
      @render_cart = true
    end

    def initialize_cart
      @cart ||=Cart.find_by(id: session[:cart_id])
      
      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart_id
      end
    end

    def set_current_user
      # finds user with session data and stores it if present
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    def require_user_logged_in!
      # allows only logged in user
      redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
    end
  end