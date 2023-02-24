class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  # def update
  #   if @list.update(list_params)
  #     redirect_to @list, notice: "List was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: "List was succesfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
