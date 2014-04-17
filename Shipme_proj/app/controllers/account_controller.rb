class AccountController < ApplicationController
  def account_view
  end


#This method to initialzie name , balnce attributes .
#name-char.
#balance-int.
#Author: MarioMaged.

    attr_reader :name, :balance
    def  initialize(name, balance=1000)
        @name = name
        @balance = balance
    end


 #This method to display the balance.
 #take pin_number.
 #Return balance.
 #Author: MarioMaged.

    def  display_balance(pin_number)
        puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
    end


  #This method to withdraw amount of mony from the balance.
  #amout int.
  #Pin_number int.
  #Return withdraw amount
  #Author: MarioMaged.

    def  withdraw(pin_number, amount)
        if pin_number == pin
            @balance -= amount
            puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
            puts pin_error
    end
  end


  private


  #This method to check the pincode.
  #Pin int.
  #Author: MarioMaged.

    def  pin
        @pin = 1234
    end


 #This method to check the error of the pincode.
 #Pin int.
 #Author: MarioMaged.

    def pin_error
        "Access denied: incorrect PIN."
    end
    end

    
my_account = Account.new("mario", 1_000_000)
my_account.withdraw(11, 500_000)
my_account.display_balance(1234)
my_account.withdraw(1234, 500_000)
my_account.display_balance(1234)
