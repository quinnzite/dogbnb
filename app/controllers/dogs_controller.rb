class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy, :new]

  def index
    @dogs = Dog.all
  end

  def show
    @fostering = Fostering.new
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def destroy
    @dog.destroy
    redirect_to dog_path(@dog)
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :description, :location)
  end
end
