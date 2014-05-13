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
  end

  def show
    @user=Users.get_user(cookies[:user_id])
    @trip=Trips.get_trips(cookies[:user_id],params[:page])
    if @trip==nil
      flash[:notice]="There Is No Trips Created Yet!"
    end
  end

  def delete
  end

  def destory
  end
end
