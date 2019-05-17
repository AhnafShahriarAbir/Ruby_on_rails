class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :prerequisite
      t.string :category
      t.string :location
      t.timestamp :created
      t.belongs_to :user , foreign_key:true

      t.timestamps
    end
  end
end
