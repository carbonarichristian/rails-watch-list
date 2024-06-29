class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmarks = Bookmark.where(list_id: params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list
      @list.save
      redirect_to list_path(@list)
    else
      redirect_to new_path
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :address, :phone_number, :category)
  end
end
