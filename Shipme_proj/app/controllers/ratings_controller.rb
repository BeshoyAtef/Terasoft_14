class RatingsController < ApplicationController
  def show
  end

  def update
    @rating = Rating.find(params[:id])
    @package = @rating.package
    if @rating.update_attributes(rating: params[:rating])
      respond_to do |format|
        format.js
       end
    end
  end

  def average_rating
	ratings.sum(:rating) / ratings.size
  end

end
