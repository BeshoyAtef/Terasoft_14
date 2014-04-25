class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

 # intended to redirect to the other page
 # Authord :Mariam .S. Elsanady

  def  index
  end


  # showing the records in details that is already created .It contain mobileNumber(integer),crediCard(integer) and id(integer) 
  # return idNumber integer creditCard integer  mobileNumber integer
  # Authord :Mariam .S. Elsanady

  def  show
  end


  # Create new user information. 
  #Inputs are idNumber integer creditCard integer  mobileNumber integer
  # Authord :Mariam .S. Elsanady

  def  new
    @user = User.new
  end

   
  # This method is active when the user click on create so it will save his information and redirect to new page . 
  #return is idNumber integer creditCard integer  mobileNumber integer
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
