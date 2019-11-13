class Api::V1::MoviesController < ApplicationController
    before_action :set_movie, only: [:show]

    def index
        movies = Movie.all
        render json: movies,include: "**", status: 200
    end

    def show
        render json: movie, include: "**", status: 200
    end

    def create
        movie = Movie.create(movie_params)
        render json: movie, status: 201
    end
    
    private

    def set_movie
        movie = Movie.find(params[:id])
    end

    def movie_params
        params.permit(:title, :api_id, :poster_path)
    end
end
