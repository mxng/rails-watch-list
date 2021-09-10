class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params["bookmark"][:movie_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @movie = Movie.find(params["bookmark"][:movie_id])
    @bookmark.movie = @movie
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end

  # def movie_params
  #   params.require(:movie).permit(:title)
  # end
end
