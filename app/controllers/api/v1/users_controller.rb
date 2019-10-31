class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show,:update,:destroy]

    def index
        users = User.all
        render json: users, status: 200
    end

    def show
        render json: User.create(user_params)
    end

    def create
        
        payload = {user_id: user.id}
        token = JWT.encode(payload, ENV[JWT_SECRET_KEY], true {algorithm: "HS256"})
        render json: {user: user, token: token}

    end
    
    private

    def user_params
        params.permit(:username, :password)
    end
end
