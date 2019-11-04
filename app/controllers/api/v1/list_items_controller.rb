class Api::V1::ListItemsController < ApplicationController
    before_action :set_list_item, only: [:show,:update,:destroy]

    def index
        list_items = ListItem.all
        render json: list_items, status: 200
    end

    def show
        render json @list_item, status: 200
    end
  
    def create
        if logged_in?
            list_item = ListItem.create(list_item_params)
            if list_item.valid?
                render json: list_item, status:201
            else
                render json: { errors: list_item.errors.full_messages }, status: :unauthorized
            end
        end
    end
  
    def update
      if logged_in?
        @list_item.update(list_item_params)
        render json: @list_item, status: 200
      else
        render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
      end
    end
  
    def destroy
      if logged_in?
        list_itemId = @list_item.id
        @list_item.destroy
        render json: {errors: "You have deleted your Account", list_itemId: list_itemId}
      else
        render json: { errors: "You have to be logged in to see this page"}, status: :unauthorized
      end
    end
  
    # def show
    #   if logged_in?
    #     render json: @list_item, status: 200
    #   else
    #     render json: { errors: "You have to be logged in to see this page" }, status: :unauthorized
    #   end
    # end
  
    private
    def list_item_params
      params.permit(:list_id, :movie_id)
    end
  
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end
end
