class CreateCategoriesCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_courses, id: false do |t|
    	t.integer :course_id, null: false
    	t.integer :category_id, null: false
    end
  end
end

