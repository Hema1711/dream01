class WishlistController < ApplicationController
    skip_before_action :verify_authenticity_token



    def delete_wishlist

    end

    # def wishlist_param
	# 	params.require(:cart).permit(:user_unique_id, :product_unique_id)
	# end
end
