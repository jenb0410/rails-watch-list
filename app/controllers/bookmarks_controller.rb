class BookmarksController < ApplicationController
  before_action :set_list, only: %i[update]

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

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "Bookmark was successfully updated."
    else
      render :edit, status: :unprocessable_entity
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
    @list = List.find(params[:bookmark_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:bookmark)
  end
end
