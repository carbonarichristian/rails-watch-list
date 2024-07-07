class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def home
  end

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
    if @list.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_path, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :picture)
  end
end
