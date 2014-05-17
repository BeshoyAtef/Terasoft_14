class SearchEngineController < ApplicationController
	
#This method gets all users with a certain name.
#username - string.
#Returns all_users - array.
#Author Madeleine A. Saad.

  def list
  	$name=params[:text]
  	@all_users= Users.search_users_with_same_name($name)
  end


#This method shows a search box.
#Author Madeleine A. Saad.
  def index
  end

end
