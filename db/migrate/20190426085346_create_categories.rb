class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :category
      t.string :location
      t.timestamp :created
      t.timestamps
    end
  end
end
