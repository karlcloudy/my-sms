class CreateCourseInstituteRelationship < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.belongs_to :institute
      t.foreign_key :institutes
    end
  end
end
