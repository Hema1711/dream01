module ProductInformation
	class UserService

		def self.get_user(email_id)
			data = User.find_by(email: email_id)
		end

		def self.new_user
			user_info = User.new
			return user_info
		end

		def self.edit_user(user_id)
			 byebug
			user_details = User.select(:id).includes(:address)
		
			
		end

		def self.update_user(id,params)
			# byebug
			user = User.find(id)
			user.update(params)
			
		end


		def self.create_user(email_id)
			user_info = User.new(email: email_id)
			if (user_info.save)
				return user_info
			end

		end

		def self.delete_user(user_id)
			data = User.find(user_id)
			data.update(is_active: false)
		end
	end
end