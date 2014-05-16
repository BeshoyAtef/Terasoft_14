class SearchEngineController < ApplicationController
  def list
  	 $name=params[:text]
  	@all_users= Users.search_users_with_same_name($name)
  end

  def index
  end
end
