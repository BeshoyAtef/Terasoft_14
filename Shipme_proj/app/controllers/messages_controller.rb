class MessagesController < ApplicationController
require 'will_paginate/array'
  def index
  end

 def new
 Messages.send_new_message(cookies[ :user_id ],params[:username],params[:text])
 end 

  def show
    @messages_received=Messages.get_last_message(cookies[:user_id])
    @users = Users.all_users
    @messages=Messages.get_last_message_paginated(cookies[:user_id],params[:page])
  end 

  def create

  end

  def edit
  end

  def update
  end

  def list
  end


  def delete
  end

  def destory
  end
end
