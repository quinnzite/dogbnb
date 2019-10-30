class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
    @dogs = Dog.geocoded #returns flats with coordinates

    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude
        # infoWindow: render_to_string(partial: "info_window", locals: { dog: dog })
      }
    end
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
    redirect_to user_dashboard_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :description, :location, :photo)
  end
end
