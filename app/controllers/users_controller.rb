class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
	before_action :admin, only: [:show, :update, :destroy, :edit]

	def user_index
		# byebug
		email_id = $session_user
		if (email_id  == "")
			@user_index = User.last
		else
			@user_index = ProductInformation::UserService.get_user(email_id)
		end
	end
		

	def edit_user
		# byebug
		@user_info =ProductInformation::UserService.edit_user(params[:id])
		render json: @user_info
		# redirect_to edit_user_path
	end

    def update_user
		byebug
		@user_info= ProductInformation::UserService.update_user(params[:id],parameters)
		redirect_to user_index_path
	end

	def create_user
		@user_info = ProductInformation::UserService.create_user(parameters)
		redirect_to user_index_path
	end

	def delete_user
		@data=ProductInformation::UserService.delete_user(user_id)
	end

	private
	def parameters
		params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :file_extension, :language)
	end
end
