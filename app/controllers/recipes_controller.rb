class RecipesController < ApplicationController
  def index
    @recipes = Recipe.published
  end
  
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

  def publish
    @recipe = Recipe.find(params[:id])
    @recipe.published!
    return redirect_to @recipe
  end

  def draft
    @recipe = Recipe.find(params[:id])
    @recipe.draft!
    return redirect_to @recipe
  end

  def drafts
    @recipes = Recipe.draft
  end
end