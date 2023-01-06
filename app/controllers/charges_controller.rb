class ChargesController < ApplicationController
    rescue_from Stripe::CardError, with: :catch_exception
    def new
      byebug
    end
  
    def create
    #   byebug
      StripeChargesServices.new(charges_params, current_user).call
      redirect_to cart_index_path
    end
  
    private
  
    def charges_params
    #   byebug
      params.permit(:stripeEmail, :stripeToken, :order_id)
    end
  
    def catch_exception(exception)
      flash[:error] = exception.message
    end
  end
  