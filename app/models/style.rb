class Style < ActiveRecord::Base
  validates :name,  presence: true,
                    length: { in: 2..25 }
  
end