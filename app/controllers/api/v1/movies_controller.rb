class Api::V1::MoviesController < ApplicationController
    before_action :set_movie, only: [:show]

    def index
        movies = Movie.all
        render json: movies, status: 200
    end

    def show
        render json: movie
    end

    def create
        movie = Movie.create(movie_params)
        render json: movie
    end
    
    private

    def set_movie
        movie = Movie.find(params[:id])
    end

    def movie_params
        params.permit(:title, :api_id)
    end
end
