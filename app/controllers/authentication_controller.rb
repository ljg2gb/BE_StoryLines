class AuthenticationController < ApplicationController
    def login
        @user = User.find_by username: params[:username]

        if !@user
            render json: {message: "Try again"}
        else
            if !@user.authenticate params[:password]
                render json: {message: "Wrong password"}
            else
                payload = {
                    user_id: @user.id,
                    first_name: @user.first_name,
                    username: @user.username
                }
                secret = Rails.application.secret_key_base
                token = JWT.encode payload, secret
                render json: {token: token}
            end
        end
    end
end
