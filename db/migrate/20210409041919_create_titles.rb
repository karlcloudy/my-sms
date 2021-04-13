class CreateTitles < ActiveRecord::Migration

  def up
    # Create TITLES table.
    create_table :titles do |t|
      t.string :title, null: false, limit: 10

      t.timestamps
    end

    # Create unique index to prevent duplicate titles.
    add_index(:titles, :title, unique: true)
  end

  def down
    drop_table :titles
  end
end
