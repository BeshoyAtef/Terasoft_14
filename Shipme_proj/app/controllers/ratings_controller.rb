class RatingsController < ApplicationController
  def show
    #render('update')
    #redirect_to(:action => 'update')
  end


  #def rate_package
   #   @rating = Rating.where(package_id: @package.id, user_id: @current_user.id).
    #  first 
  def rate
    @package = packages.find(params[:id])
    @package.rate(params[:stars], current_package, params[:score])
    render :update do |page|
      page.replace_html @package.wrapper_dom_id(params), ratings_for(@package, params.merge(:wrap => false))
      page.visual_effect :highlight, @user.wrapper_dom_id(params)
  end
  
  #end
      
  end


  # Create method to update rating for package carrier.
  # Author: Rana T. Labib
  
  def update
    @rating = Rating.find(params[:id])
    @package = @rating.package
    if @rating.update_attributes(rating: params[:rating])
      respond_to do |format|
        format.js
       end
    end
  end

  # Calculates the average rating
  # Author: Rana T. Labib

  def average_rating
	ratings.sum(:rating) / ratings.size
  end

  

end
