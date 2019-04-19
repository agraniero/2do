class ItemsController < ApplicationController
before_action :set_item, only: [:edit, :show, :update, :destroy]
before_action :require_login

  def new
    # /lists/:list_id/items/new
    @list = current_user.lists.find_by_id(params[:list_id])
    @item = Item.new
  end

  def create
    @list = current_user.lists.find_by_id(params[:list_id])
    @item = @list.items.build(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @list = List.find_by_id(params[:list_id])
    
    
  end

  def update
    @list = List.find_by_id(params[:list_id])
    @item.user_id = current_user.id
    @item.list_id = @list.id
    if @item.update(item_params)
      #raise params
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    @list = List.find_by_id(params[:list_id])
    redirect_to list_path(@list)
  end

  private

  def set_item
    @item = Item.find_by_id(params[:id])
    
  end

  def item_params
    params.require(:item).permit(:description, :user_id, :list_id)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
