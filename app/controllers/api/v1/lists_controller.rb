class Api::V1::ListsController < ApplicationController
    before_action :set_list, only: [:show,:update,:destroy]

    def index
        lists = List.all
        render json: lists,include: "**", status: 200
    end

    def show
        render json: @list, include: "**", status: 200
    end
  
    def create
        if logged_in?
            list = List.create(list_params)
            if list.valid?
                render json: list, status:201
            else
                render json: { errors: list.errors.full_messages }, status: :unauthorized
            end
        end
    end
  
    def update
      if logged_in_user_id == @list.user_id
        @list.update(list_params)
        render json: @list, status: 200
      else
        render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
      end
    end
  
    def destroy
      if logged_in_user_id == @list.user_id
        listId = @list.id
        @list.destroy
        render json: {errors: "You have deleted your Account", listId: listId}
      else
        render json: { errors: "You have to be logged in to see this page"}, status: :unauthorized
      end
    end
  
    # def show
    #   if logged_in?
    #     render json: @list, status: 200
    #   else
    #     render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
    #   end
    # end
  
    private
    def list_params
      params.permit(:user_id, :list_name)
    end
  
    def set_list
      @list = List.find(params[:id])
    end
end
