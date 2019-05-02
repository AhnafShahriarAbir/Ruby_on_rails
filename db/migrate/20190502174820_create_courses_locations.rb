class CreateCoursesLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_locations, id: false do |t|
    	t.integer :location_id, null: false
		t.integer :course_id, null: false
    end
  end
end
