class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create new]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was succesfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list),
    status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
