class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes, dependent: :destroy
  has_many :recipe_styles
  has_many :styles, through: :recipe_styles, dependent: :destroy
  validates :chef_id,     presence: true
  validates :name,        presence: true,
                          length: { in: 5..100 }
  validates :summary,     presence: true,
                          length: { in: 10..150 }
  validates :description, presence: true,
                          length: { in: 20..2000 }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end