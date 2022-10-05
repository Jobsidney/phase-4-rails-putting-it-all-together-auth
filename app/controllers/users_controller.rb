class UsersController < ApplicationController

    skip_before_action :authorized?,only: [:create,:show]
    
    def create
        user=User.create(user_params)
        if user
             session[:user_id]=user.id
             render json: user,status: :created        
        else
            renders json:{error: user.errors.full_messages},status: :unprocessable_entity
        end
    end

    def show
        user=User.find(session[:user_id])
        if user
            render json:user,status: :created
        else
            render json: {error: user.errors.full_messages},status: :unauthorized
        end

    end

    private
    def user_params
        params.permit(:username, :password,:image_url,:bio)
    end
end
