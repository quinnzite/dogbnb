class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update]

  def create
    @review = Review.new(review_params)
    authorize @review
    @fostering = Fostering.find(params[:fostering_id])
    @review.fostering = @fostering
    @review.save
    if @review.save
      redirect_to fostering_path(@fostering)
    else
      render 'fosterings/show'
    end
  end

  def update
    authorize @review
    @review.update(review_params)
    @review.save
    if @review.save
      redirect_to dog_path(@review.fostering.dog_id)
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit([:rating, :content])
  end
end
