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
  end

  def delete
  end

  def destory
  end
end
