class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @ingredients = Ingredient.all
    @dose = Dose.new
    @review = Review.new
    total = @cocktail.reviews.map do
      |review| review.rating
    end
    if total.size == 0
      @average = 0
    else
      @average = total.sum / total.size
    end
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def search
    @cocktails = Cocktail.where("name LIKE '%#{params[:tag]}%'")
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
