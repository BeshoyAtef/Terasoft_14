class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def list
      def list
    @package = Users.packages_find
    @trip = Users.trips_find
    @users =  Users.users_find
  end

  def show
  end

  def delete
  end

  def destory
  end
end
