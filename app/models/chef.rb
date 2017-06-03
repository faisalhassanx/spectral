class Chef < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { in: 3..40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format:     { with: VALID_EMAIL_REGEX }
end