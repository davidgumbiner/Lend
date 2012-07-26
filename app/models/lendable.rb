class Lendable < ActiveRecord::Base
  attr_accessible :name, :content
  
  belongs_to :user
  has_many :requesters, through: :requests, source: requester
  has_many :requests
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  default_scope order: 'lendables.created_at DESC'
  
  def requested?
    self.requests.present?
  end
  
  private

  def request!(lendable)
    requests.create!(lendable_id: lendable.id)
  end
  
  def unrequeust!(lendable)
    requests.find_by_lendable_id(lendable.id).destroy
  end
end
