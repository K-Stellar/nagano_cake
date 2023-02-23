class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre_product = @genre.products.all.order("created_at DESC").page(params[:page])
  end


end
