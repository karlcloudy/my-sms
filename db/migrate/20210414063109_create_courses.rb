class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description
      t.integer :number_of_semesters, null: false
      t.integer :allocation
      t.date :start_date, null: false
      t.date :end_date, null: false
      
      t.timestamps
    end

    # Create unique index to prevent duplicate course names.
    add_index(:courses, :name, unique: true)
  end
end
