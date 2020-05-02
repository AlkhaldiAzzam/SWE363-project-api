class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create , :getUser, :index], raise: false
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    @user_data = User.where(email: user_params[:email])
    response = { user_data: @user_data[0],message: Message.account_created, auth_token: auth_token }
    json_response( response, :created)
  end
  
  def show
    json_response(current_user)

  end

  def getUser
    user = User.find(params[:id])
    response = {username: user.username,first_name: user.first_name, last_name: user.last_name, user_type: user.user_type, email: user.email, id: user.id}
    json_response(response)
  end

  def index
    
    if (params[:q]) 
    users = User.where("username LIKE ?", "%" + params[:q] + "%")
      json_response(users)
      
    else
      json_response(User.all)
    end
    
  end


  def delete
    if current_user.user_type === "admin"
      User.delete(params[:id])
      

      response = {message: " user has been deleted"}
      json_response(response)
    end
  end



  def promote
    if current_user.user_type === "admin"
      @user = User.find(params[:id])
      @user.user_type = "admin"
      @user.save

      response = {message: " #{@user.username} has been promoted"}
      json_response(response)
    end
  end

  def demote
    if current_user.user_type === "admin"
      @user = User.find(params[:id])
      @user.user_type = "normal user"
      @user.save

      response = {message: " #{@user.username} has been demoted"}
      json_response(response)
    end
  end
  
  def update
    current_user.update(user_params)
    json_response(current_user)

    # head :no_content
  end

    private
  
    def user_params
      params.permit(
        :first_name,
        :username,
        :last_name,
        :user_type,
        :u_id,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
