class CreateCoordinators < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinators do |t|
      t.string :name
      t.string :email
      t.integer :course_id

      t.timestamps
    end
  end
end
