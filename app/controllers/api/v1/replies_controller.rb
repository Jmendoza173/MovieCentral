class Api::V1::RepliesController < ApplicationController
    before_action :set_reply, only: [:show,:update,:destroy]

    def index
        replies = Reply.all
        render json: replies, status: 200
    end

    def show
        render json @reply, status: 200
    end
  
    def create
        if logged_in?
            reply = Reply.create(reply_params)
            if reply.valid?
                render json: reply, status:201
            else
                render json: { errors: reply.errors.full_messages }, status: :unauthorized
            end
        end
    end
  
    def update
      if logged_in_user_id == @reply.user_id
        @reply.update(reply_params)
        render json: @reply, status: 200
      else
        render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
      end
    end
  
    def destroy
      if logged_in_user_id == @reply.user_id
        replyId = @reply.id
        @reply.destroy
        render json: {errors: "You have deleted your Account", replyId: replyId}
      else
        render json: { errors: "You have to be logged in to see this page"}, status: :unauthorized
      end
    end
  
    # def show
    #   if logged_in?
    #     render json: @reply, status: 200
    #   else
    #     render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
    #   end
    # end
  
    private
    def reply_params
      params.permit(:content,:user_id, :discussion_id)
    end
  
    def set_reply
      @reply = Reply.find(params[:id])
    end
end
