class DogsController < ApplicationController
<<<<<<< HEAD
  before_action :set_dog, only: [:show, :edit, :update, :destroy, :new]
=======
  before_action :set_dog, only: [:show, :edit, :update, :delete]
>>>>>>> master

  def index
    @dogs = Dog.all
  end

  def show
    authorize @dog
    @fostering = Fostering.new
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    authorize @dog
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    authorize @dog
  end

  def update
    authorize @dog
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def destroy
    authorize @dog
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :description, :location, :photo)
  end
end
