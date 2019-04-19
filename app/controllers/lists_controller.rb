class ListsController < ApplicationController
before_action :set_list, only: [:show, :edit, :update, :destroy]
before_action :require_login

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
   
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
     
      #render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find_by_id(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end

end
