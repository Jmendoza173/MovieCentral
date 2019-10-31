class AuthController < ApplicationController

    def login
        user= User.find_by(username: user_params[:username])
        if user && user.authenticate(user_params[:password])
            payload = {user_id: user.id}
            token = JWT.encode(payload, ENV[JWT_SECRET_KEY], true, {algorithm: 'HS256'})
            render json: {user: user, token: token}
        else
            render json: { errors: ["The information you enter does not match our database. Please Try Again"]}, status: :unprocessable_entity
        end
    end

    def persist
        auth = request.headers['Authorization']
        if auth
            token = auth.split(' ')[1]
            decoded_token = JWT.decode(token, ENV[JWT_SECRET_KEY], true, {algorithm: 'HS256'})

            user = User.find(decoded_token[0]['user_id'])
            render json: user
        end
    end

end
