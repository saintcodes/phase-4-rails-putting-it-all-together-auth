class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    if user.id == User.find_by(id: session[:user_id])
      render json: recipes, status: :created
    else
      render json: {error: "Not authorized"}, status: :unauthorized
    end
  end

end
