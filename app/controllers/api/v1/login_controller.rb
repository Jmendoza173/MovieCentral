class Api::V1::LoginController < ApplicationController

    def index
        if(request.headers['Authorization'])
            encoded_token = request.headers['Authorization']
            token = JWT.decode(encoded_token, hmac_secret, true, {algorithm: "HS256"})
            user_id = token[0]['user_id']
            user = User.find(user_id)
            render json: user
        end
    end

    def create
        user = User.find_by("lower(username) = ?", params[:username].downcase)
        if user && user.authenticate(params[:password])
            render json: authentication_json(user.id, user.username)
        else
            render json: { errors: [ "The User or Password you enter is Invalid." ] }, status: :unprocessable_entity
        end 
    end

end