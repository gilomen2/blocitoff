class ItemsController < ApplicationController
  def create
    @user = current_user
    @items = @user.items
    @item = Item.new(item_params)
    @item.user = current_user
    @new_item = Item.new

    unless @item.save
      flash[:error] = "There was a problem saving the item. Please try again."

    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = current_user
    @item = Item.find(params[:id])

    unless @item.destroy
      flash[:error] = "There was a problem deleting the item. Please try again."
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
