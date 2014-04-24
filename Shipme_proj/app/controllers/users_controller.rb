class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Listing the user input that is sucessfuly created .It contain mobileNumber(integer),crediCard(integer) and id(integer) 
 # Authord :Mariam .S. Elsanady

  def  index
    @users = User.all
  end


  # showing the records in details that is already created .It contain mobileNumber(integer),crediCard(integer) and id(integer) 
  # Authord :Mariam .S. Elsanady

  def  show
  end


  # Create new user information. Input is mobileNumber(integer(10)),crediCard(integer(5)) and id(integer(5)) 
  # Authord :Mariam .S. Elsanady

  def  new
    @user = User.new
  end


   # Editing the information of the user that is already created (updating his information). Edited items could be mobileNumber(integer(12)),crediCard(integer(19)) and id(integer(22))
  # Authord :Mariam .S. Elsanady

  def  edit
  end

  
  # This method is active when the user click on create so it will save his information and redirect to new page . input parameters are mobileNumber(integer(12)),crediCard(integer(19)) and id(integer(22))
  # Authord :Mariam .S. Elsanady

  def  create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # This method is done when the user is in the edit page and he update his information by click on update information  
   # Authord :Mariam .S. Elsanady

  def  update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # It settel all parameters that is created by user
 # Authord :Mariam .S. Elsanady

  private
    def  set_user
      @user = User.find(params[:id])
    end
    def  user_params
      params.require(:user).permit(:creditCard, :mobileNumber, :idNumber)
    end
end
