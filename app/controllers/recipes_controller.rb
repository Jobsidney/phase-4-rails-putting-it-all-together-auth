class RecipesController < ApplicationController

    def index
        recipe= Recipe.all 
        render json:recipe,status: :created
    end

    def create
        recipe= Recipe.create!(
            title: params[:title],
            instruction: params[:instructions],
            minutes_to_complete: params[:minutes_to_complete],
            user_id: session[:user_id]
        )
        if recipe
            render json:recipe,status: :created
        else
            render json: {error: user.errors.full_messages},status: :unprocessable_entity
        end
    end

    private
    def recipe_params
        params.permit(:title,:instruction,:minutes_to_complete,user_id: session[:user_id])
    end
end
