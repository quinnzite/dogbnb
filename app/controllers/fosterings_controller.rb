class FosteringsController < ApplicationController
  before_action :set_fostering, only: [:edit, :update, :show, :destroy]

  def show
    authorize @fostering
    @review = Review.new
  end

  def new
    @fostering = Fostering.new
    authorize @fostering
  end

  def create
    @fostering = Fostering.new(fostering_params)
    authorize @fostering
    @fostering.user = current_user
    @fostering.dog = Dog.find(params[:dog_id])
    if @fostering.save
      redirect_to dog_path(@fostering.dog_id)
    else
      render :new
    end
  end

  def destroy
    authorize @fostering
    @fostering.destroy
    redirect_to user_dashboard_path
  end

  private

  def set_fostering
    @fostering = Fostering.find(params[:id])
  end

  def fostering_params
    params.require(:fostering).permit([:start_date, :end_date])
  end
end
