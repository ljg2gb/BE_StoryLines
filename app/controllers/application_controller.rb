class ApplicationController < ActionController::API
    def authenticate
        auth_header = request.headers["Authorization"]
        token = auth_header.split(" ")[1]
        secret = Rails.application.secret_key_base

        begin
            payload =  JWT.decode(token, secret)[0]
            user_id = payload["user_id"]
            first_name = payload["first_name"]
            username = payload["username"]
            @user = User.find(user_id)

            if !@user
                render status: :unauthorized
            end
        rescue
            render status: :unauthorized
        end
    end
end
