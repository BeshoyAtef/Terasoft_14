class RequestAcceptanceController < ApplicationController
	do
    AcceptanceMail.notifier.deliver if my_condition == true
end
