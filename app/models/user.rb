class User < ActiveRecord::Base
   attr_accessible :name, :email, :password, :password_confirmation
   has_secure_password
   has_many :lendables, dependent: :destroy
   has_many :requests, foreign_key: "requester_id", dependent: :destroy

   before_save { |user| user.email = email.downcase }
   before_save :create_remember_token

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    
    def request!(lendable)
      requests.create!(lendable_id: lendable.id)
    end

    def unrequeust!(lendable)
      requests.find_by_lendable_id(lendable.id).destroy
    end
    
    private

        def create_remember_token
          self.remember_token = SecureRandom.urlsafe_base64
        end
end
