class Lendable < ActiveRecord::Base
  attr_accessible :name, :content
  
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  default_scope order: 'lendables.created_at DESC'
end
