class ItemsController < ApplicationController
  def create
    @user = current_user
    @items = @user.items
    @item = Item.new(item_params)
    @item.user = current_user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was saved."

    else
      flash[:error] = "There was a problem saving the item. Please try again."

    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
