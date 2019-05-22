class Course < ApplicationRecord
  has_and_belongs_to_many :categories, dependent: :destroy
  has_and_belongs_to_many :locations, dependent: :destroy
  has_many :users
  has_many :likes, dependent: :destroy
  has_many :unlikes, dependent: :destroy

  def enrolled_in?(category)
      self.categories.include?(category)
  end

  def unenrolled_categories
    Category.all - self.categories
  end
end
