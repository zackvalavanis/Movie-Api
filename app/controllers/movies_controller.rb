class MoviesController < ApplicationController
  def index 
    @movies = Movie.all
    render :index
  end
  def show 
    @movie = Movie.find_by(id: params[:id])
    render :show 
  end
  def create
    @movie = Movie.new( 
      name: params[:name], 
      year: params[:year], 
      lead_actor: params[:lead_actor], 
      sales: params[:sales]
    )
    @movie.save
    render :show
  end
  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update(
      name: params[:name] || @movie.name, 
      year: params[:year] || @movie.year,
      lead_actor: params[:lead_actor] || @movie.lead_actor, 
      sales: params[:sales] || @movie.sales
    )
    render :show
  end
  def destroy 
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy
    render json: { message: "The data has been deleted."}
  end
end