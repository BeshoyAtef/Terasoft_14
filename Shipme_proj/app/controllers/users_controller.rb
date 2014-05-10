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
 @user=Users.find_by_id(cookies[:user_id])
  if Users.exists?(:id =>cookies[:user_id] )
  $mobileNumber=params[:mobileNumber];
  $creditCard=params[:creditCard];
  $idNumber=params[:idNumber];
  @user.update(:mobileNumber => $mobileNumber,:creditCard => $creditCard,:idNumber=> $idNumber) 
   @user.save

end
end

  def list
  @users = Users.find(:all, :conditions => "users.idVerify IS NULL")
  end

  def show
  end



  def delete
  end

  def destory
  end
def update_attribute
@users = Users.scoped(:conditions => " users.idVerify IS NULL")
$idVerify=params[:idVerify];
@users.update_all(:idVerify=> true) 
@users.each(&:save)
end
end 
  