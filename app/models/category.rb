class Category < ApplicationRecord
  has_and_belongs_to_many :courses

  def enrolled_in?(course)
  	self.courses.include?(course)
  end

  def unenrolled_courses
  	Course.all - self.courses
  end
end
