class Admin::GenresController < ApplicationController
  layout 'admin'
  before_action :move_to_signed_in
  
  def index
    @genre = Genre.new
    @genres = Genre.all
    
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end
  
  private

  def genre_params
     params.require(:genre).permit(:name)
  end
  
  def move_to_signed_in
    unless admin_signed_in?
    redirect_to  admin_session_path

    end
  end
  
end
