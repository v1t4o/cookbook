class HomeController < ApplicationController
  def index
    @recipes = Recipe.all.count
  end
end