class Request < ActiveRecord::Base
  attr_accessible :item_id, :requester_id
end
