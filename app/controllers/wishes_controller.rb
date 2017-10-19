class WishesController < ApplicationController
	def create
		item = Item.find(params[:id])
		Wish.create(user:current_user, item:item) unless item.wishers.include? current_user

		return redirect_to items_path
	end

	def destroy
		item = Item.find(params[:id])
		wish = Wish.find_by(item: item, user: current_user)
		wish.delete unless wish === nil

		return redirect_to items_path
	end
end
