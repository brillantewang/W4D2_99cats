class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save!
      render :show
    else
      redirect_to new_cat_url
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def destroy
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :edit
    else
      redirect_to cats_url
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
