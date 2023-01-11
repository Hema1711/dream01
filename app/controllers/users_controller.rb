class UsersController < ApplicationController
	
    skip_before_action :verify_authenticity_token
	# include Secured
	# before_action :admin, only: [:show, :update, :destroy, :edit]
	require 'securerandom'

	
	# def login 
    #     byebug
    #     @user = session[:userinfo]
    #     if session[:current_user_id].present?
    #         if session[:current_user_role]
    #             redirect_to index_path, notice: "Admin is not logged out yet"
    #         else
    #             redirect_to show_path, notice: "User is not logged out yet"
    #         end
    #     end
    # end

	def verify_user
		byebug
        @user_login =  ProductInformation::UserService.user_login(params[:email_id],params[:password])
        
        if @user_login.nil? 
            @user_login =  "email-id Doesn't Exists"
            render :login, status: :unprocessable_entity

        elsif @user_login == false 
            @user_login = "Email id is exists, but Incorrect password"
            render :login, status: :unprocessable_entity

        else
            # byebug
            session[:current_user_id] = @user_login.id
            session[:current_user_role] = @user_login.is_admin
            if @user_login.is_admin
                redirect_to index_path, notice: "Admin Login Success"
            else
                redirect_to show_path, notice: "User Login Success"
            end
            
        end

    end 

	def logout
		# byebug
		reset_session
		redirect_to login_index
	end
	

	# def create_user
	# 	byebug
	# 	$session_user = params[:email_id]
	# 	unique_id = SecureRandom.alphanumeric(20)
	# 	cart_unique_id =  SecureRandom.alphanumeric(8)
	# 	@user_info= ProductInformation::UserService.create_user(unique_id,cart_unique_id,params[:email_id],params[:phone_number])
	# 	redirect_to user_index_path
	# 	# redirect_to '/users/get_user'

	# end

	# def verify_user
	# 	byebug
	# 	email_id = params[:email_id]
	# 	password = params[:password]
	# 	if email_id.present?
	# 		redirect_to product_index_path
	# 	else
	# 		render :login_index, status: :unprocessable_entity
	# 	end

	# end




	def user_index
		# byebug
		email_id = $session_user
			@user_info = ProductInformation::UserService.get_user(email_id)
	end
		
	def login_index
	end


	def edit_user
		# byebug
		@countries = CS.countries.invert
		@states = CS.states(:us).invert
		@cities =CS.cities(:ak, :us)
		email_id = $session_user
		
		@user_info =ProductInformation::UserService.edit_user(params[:unique_id])
	end

    def update_user
		# byebug
		@user_info= ProductInformation::UserService.update_user(params[:unique_id],user_params)
		redirect_to user_index_path
	end



	def delete_user
		@data=ProductInformation::UserService.delete_user(user_id)
	end

	def get_states_by_country
            country = (params[:country])
            @states = ProductInformation::UserService.get_states_by_country_id(country)
            render json: @states
    end

  	def get_cities_by_state
			state = (params[:state]) 
            @cities = ProductInformation::UserService.get_cities_by_state_id(state)
            render json: @cities
    end


	private
	def user_params
		params.require(:user_details).permit(:first_name, :last_name, :email, :phone_number, :country, :city, :state, :file_extension, :cart_unique_id)
	end

end
