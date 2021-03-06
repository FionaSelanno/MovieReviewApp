class MoviesController < ApplicationController

  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: "Movie was succesfully updated"
      #redirect to the movie_path and run the show action to see the updates
    else
      render 'edit'
    end
  end

  def new
    @movie= Movie.new
  end

  def create
    @movie= Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie), notice: "Movie was succesfully created"
    else
      render "new"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title, :description, :rating, :total_gross, :released_on, :cast, :director, :duration, :image_file_name )
  end

end
