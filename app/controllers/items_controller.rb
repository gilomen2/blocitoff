class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to current_user
    else
      flash[:error] = "There was a problem saving the item. Please try again."
      redirect_to current_user
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
