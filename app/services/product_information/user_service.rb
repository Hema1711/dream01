module ProductInformation
	class UserService

		def self.get_user(email_id)
			data = User.find_by(email: email_id)
		end

		def self.new_user
			user_info = User.new
			return user_info
		end

		def self.edit_user(unique_id)
			# byebug
			user_details = User.where(is_active: true).find_by(unique_id: unique_id)

		end

		def self.update_user(unique_id,params)
			# byebug
			user = User.where(is_active: true).find_by(unique_id: unique_id)
			user.update(params)
			
		end


		def self.create_user(unique_id, cart_unique_id, email_id)
			# byebug
			user_info = User.new(unique_id:unique_id,cart_unique_id: cart_unique_id,email: email_id )
			user_info.save
		end


		def self.get_states_by_country_id(country)
			@states = CS.states(country).invert
        end

     
        def self.get_cities_by_state_id(state)
            @cities =CS.cities(state, :us)
        end

		def self.delete_user(user_id)
			data = User.find(user_id)
			data.update(is_active: false)
		end
	end
end