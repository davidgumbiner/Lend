class Request < ActiveRecord::Base
  attr_accessible :lendable_id, :requester_id
  
  belongs_to :requester_id, class_name: "User"
  belongs_to :lendable_id, class_name: "Lendable"
  
  validates :requester_id, presence: true
  validates :lendable_id, presence: true
end
