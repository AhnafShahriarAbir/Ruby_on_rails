class CreateCategoriesCourses < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :courses, id: false do |t|
    	t.index [:category_id, :course_id] 
      t.index [:course_id, :category_id] 
    end
  end
end

