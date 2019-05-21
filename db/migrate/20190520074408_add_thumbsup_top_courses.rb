class AddThumbsupTopCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses ,:thumbsup, :integer
    add_column :courses ,:thumbsdown, :integer
  end
end
