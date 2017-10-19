class ItemsController < ApplicationController

	def index
		@user = User.find(current_user)
		q1 = @user.items
		q2 = @user.wishing
		@users_wishes =  q1 + q2 # [<Item>, <Item>]
		@other_wishes = Item.where.not( id: @users_wishes )
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			flash[:notice] = ["Successfully created item"]
			return redirect_to items_path
		end
		flash[:errors] = @event.errors.full_messages
		return redirect_to :back
	end

	def destroy
		@item = Item.find(params[:id])

		@item.delete if @item.user == current_user

		return redirect_to items_path(current_user)
	end

	def show
		@item = Item.find(params[:id])
	end

	private
		def item_params
			params.require(:item).permit(:name, :price).merge(user: current_user)
		end
end
