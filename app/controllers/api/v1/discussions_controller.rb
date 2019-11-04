class Api::V1::DiscussionsController < ApplicationController
    before_action :set_desc, only: [:show,:update,:destroy]

    def index
        discussions = Discussion.all
        render json: discussions, status: 200
    end

    def show
        render json @discussion, status: 200
    end
  
    def create
        if logged_in?
            discussion = Discussion.create(desc_params)
            if discussion.valid?
                render json: discussion, status:201
            else
                render json: {errors: user.errors.full_messages}, status: :unauthorized
            end
        end
    end
  
    def update
      if logged_in_user_id == @discussion.user_id
        @discussion.update(desc_params)
        render json: @discussion, status: 200
      else
        render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
      end
    end
  
    def destroy
      if logged_in_user_id == @discussion.user_id
        discussionId = @discussion.id
        @discussion.destroy
        render json: {errors: "You have deleted your Account", discId: discussionId}
      else
        render json: { errors: "You have to be logged in to see this page"}, status: :unauthorized
      end
    end
  
    # def show
    #   if logged_in?
    #     render json: @discussion, status: 200
    #   else
    #     render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
    #   end
    # end
  
    private
    def disc_params
      params.permit(:content,:user_id, :movie_id)
    end
  
    def set_disc
      @discussion = Discussion.find(params[:id])
    end
end
