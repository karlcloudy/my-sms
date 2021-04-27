class AddTitleForeignKeyToStudent < ActiveRecord::Migration
  def up
    add_foreign_key :students, :titles
  end

  def down
    remove_foreign_key :students, :titles
  end
end
