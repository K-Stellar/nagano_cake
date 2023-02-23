class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre_page = Genre.page(params[:page])
  end

  
end
