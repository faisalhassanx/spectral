class Recipe < ActiveRecord::Base
  validates :name,        presence: true,
                          length: { in: 5..100 }
  validates :summary,     presence: true,
                          length: { in: 10..150 }
  validates :description, presence: true,
                          length: { in: 20..500 }
end