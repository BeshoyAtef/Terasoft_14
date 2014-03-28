class CountTrans < ApplicationController
	def countTrans
		@count = 0
		if (t.deliverd == true)
			count ++
		else
			count
		end 
	end 