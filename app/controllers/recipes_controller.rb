class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    recipe_params = params.require(:recipe).permit(:name,:recipe_type_id,:cuisine,:ingredients,:cook_method,:cook_time)
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      return redirect_to @recipe
    end
    flash.now['alert'] = 'Não foi possível salvar'
    render 'new'
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    recipe_params = params.require(:recipe).permit(:name,:recipe_type_id,:cuisine,:ingredients,:cook_method,:cook_time)
    if @recipe.update(recipe_params)
      return redirect_to @recipe
    end
    flash.now['alert'] = 'Não foi possível alterar'
    render 'edit'
  end
end