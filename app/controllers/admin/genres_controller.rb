class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
  end

  def edit
  end
end
