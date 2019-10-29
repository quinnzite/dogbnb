class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.fostering = Fostering.find(params[:fostering_id])
    @review.save
    if @review.save
      redirect_to dog_path(@review.fostering.dog_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
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
