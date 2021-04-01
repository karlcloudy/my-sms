class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :title, null: false, limit: 10
      t.string :first_name, null: true
      t.string :middle_name, null: true
      t.string :last_name, null: false
      t.string :email, null: false
      t.date :birth_date, null: false
      t.string :gender, null: false, limit: 1 #'M', 'F', or 'O' for Male, Female, and Other respectively. Rails 3.x doesn't support enums, or I'd have used those :(

      t.timestamps
    end
  end
end
