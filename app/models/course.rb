class Course < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :locations, dependent: :destroy
end
