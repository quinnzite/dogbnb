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
    @fostering = Fostering.new
    if params[:fostering][:start_date].present?
      dates = params[:fostering][:start_date].split
      @fostering.start_date = Date.parse(dates[0])
      @fostering.end_date = dates[2] ? Date.parse(dates[2]) : Date.parse(dates[0])
    end
    authorize @fostering
    @fostering.user = current_user
    @dog = Dog.find(params[:dog_id])
    @fostering.dog = @dog

    if @fostering.save
      redirect_to user_dashboard_path
    else
      format.html {
        flash[:example_modal] = true
        render 'dogs/show'
      }
    end
  end

  def destroy
    authorize @fostering
    @fostering.destroy
    redirect_to user_dashboard_path
  end

  private

  def dates

  end

  def set_fostering
    @fostering = Fostering.find(params[:id])
  end

  def fostering_params
    params.require(:fostering).permit([:start_date, :end_date])
  end
end
