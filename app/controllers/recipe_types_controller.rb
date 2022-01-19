class RecipeTypesController < ApplicationController
  def new
    @recipe_type = RecipeType.new
  end

  def create
    recipe_type_params = params.require(:recipe_type).permit(:name)
    @recipe_type = RecipeType.new(recipe_type_params)
    if @recipe_type.save
      flash['alert'] = 'Tipo de receita gravado com sucesso'
      return redirect_to new_recipe_type_path
    end
    flash.now['alert'] = 'Não foi possível salvar novo tipo de receita'
    render 'new'
  end
end