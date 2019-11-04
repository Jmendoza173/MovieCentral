class Api::V1::RatingsController < ApplicationController
    before_action :set_rating, only: [:show,:update,:destroy]

    def index
        ratings = Rating.all
        render json: ratings, status: 200
    end

    def show
        render json @rating, status: 200
    end
  
    def create
        if logged_in?
            rating = Rating.create(rating_params)
            if rating.valid?
                render json: rating, status:201
            else
                render json: { errors: rating.errors.full_messages }, status: :unauthorized
            end
        end
    end
  
    def update
      if logged_in_user_id == @rating.user_id
        @rating.update(rating_params)
        render json: @rating, status: 200
      else
        render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
      end
    end
  
    def destroy
      if logged_in_user_id == @rating.user_id
        ratingId = @rating.id
        @rating.destroy
        render json: {errors: "You have deleted your Account", ratingId: ratingId}
      else
        render json: { errors: "You have to be logged in to see this page"}, status: :unauthorized
      end
    end
  
    # def show
    #   if logged_in?
    #     render json: @rating, status: 200
    #   else
    #     render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
    #   end
    # end
  
    private
    def rating_params
      params.permit(:rating,:user_id, :movie_id)
    end
  
    def set_rating
      @rating = Rating.find(params[:id])
    end
end
