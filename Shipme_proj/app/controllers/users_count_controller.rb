class UsersCountController < ApplicationController
def count
  @count_users  = Users.Count
  end
end
