class ReviewsController < ApplicationController
  skip_forgery_protection
  
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movie_path(@review.movie)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
