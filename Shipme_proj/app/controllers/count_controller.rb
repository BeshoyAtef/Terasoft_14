class CountController < ApplicationController
  def count 
  	@count = 0
  	if (t.delevierd == true)
  		count ++ 
  	else 
  		count 
  end
end
