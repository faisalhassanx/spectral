class Chef < ActiveRecord::Base
  validates :name,  presence: true, length: { in: 3..40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format:     { with: VALID_EMAIL_REGEX }
end