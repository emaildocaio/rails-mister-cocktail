class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to cocktail_path(@cocktail)
  end

  def new
    @cocktail = Cocktail.new # needed to instantiate the form_for
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
   @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktails_path
  end

   private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
