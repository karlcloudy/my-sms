class CreateStudentTitleRelationship < ActiveRecord::Migration
  def up
    # Rename old title column and add new reference to title.
    change_table :students do |t|
      t.rename :title, :title_migrated
      
      t.references :title
    end
    
    # Make nullable, since this is only for old data.
    change_column_null :students, :title_migrated, true
  end

  def down 
    rename_column :students, :title_migrated, :title
    change_column_null :students, :title, true
    remove_column :students, :title_id
  end
end
