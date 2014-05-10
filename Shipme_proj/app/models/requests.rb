class Requests < ActiveRecord::Base
  require 'will_paginate/array'
  belongs_to :sender, :class_name => "Users"
  belongs_to :carrier, :class_name => "Users"
  belongs_to :packages

  def self.get_requests_paginated(user_id,page)
    @requests = Requests.find(:all, :conditions => {:carriers_id => user_id, :accept => nil })
    @requests=@requests.paginate(:page => page, :per_page => 1)
  end
  def self.get_requests(user_id)
    @requests = Requests.find(:all, :conditions => {:carriers_id => user_id})
  end
  def self.accepted_requests(user_id)
    @requests = Requests.find(:all, :conditions => {:carriers_id => user_id, :accept => true })
  end
  def self.show_request(id)
    @request=Requests.find(id)
  end

  def self.update_request(request,flag)
    request.update(:accept => flag)
  end 

  def self.update_sender(request)
    request.update(:senders_id => nil)
  end

  def self.get_requests_senders(user_id)
    @requests = Requests.find(:all, :conditions => {:senders_id => user_id})
  end   

end  
