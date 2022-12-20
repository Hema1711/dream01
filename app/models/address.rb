class Address < ApplicationRecord
	belongs_to :user
	# belongs_to :city_village
	# belongs_to :district
	# belongs_to :state
	# belongs_to :country
end
