class AuthenticationController < ApplicationController

    skip_before_action :authorize_request, only: :authenticate, raise: false
    # return auth token once user is authenticated
    def authenticate
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call

        # @users = User.all
          @user_data = User.where(email: auth_params[:email])

        response = {user_data: @user_data[0], auth_token: auth_token}

      json_response(response)
    end
  
    private
  
    def auth_params
      params.permit(:email, :password)
    end
  end