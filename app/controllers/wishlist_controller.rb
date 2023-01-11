class WishlistController < ApplicationController
    skip_before_action :verify_authenticity_token



    def delete_wishlist
        @product_info=ProductInformation::CartService.delete_wishlist(params[:product_unique_id])
    end

    # def wishlist_param
	# 	params.require(:cart).permit(:user_unique_id, :product_unique_id)
	# end
end
