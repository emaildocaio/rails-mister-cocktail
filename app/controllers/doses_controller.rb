class DosesController < ApplicationController
  def new
    @dose = Dose.new # needed to instantiate the form_for
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.save

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to doses_path
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
