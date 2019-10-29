class FosteringsController < ApplicationController
  before_action :set_fostering, only: [:edit, :update, :show, :delete]

  def show
    @review = Review.new
  end

  def new
    @fostering = Fostering.new
  end

  def create
    @fostering = Fostering.new(fostering_params)
    @fostering.user = current_user
    @fostering.dog = Dog.find(params[:dog_id])
    @fostering.save
    if @fostering.save
      redirect_to dog_path(@fostering.dog_id)
    else
      render :new
    end
  end

  def delete
    @fostering.destroy
    redirect_to dogs_path
  end

  private

  def set_fostering
    @fostering = Fostering.find(params[:id])
  end

  def fostering_params
    params.require(:fostering).permit([:start_date, :end_date])
  end
end
