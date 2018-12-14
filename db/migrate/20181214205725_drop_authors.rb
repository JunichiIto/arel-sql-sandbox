class DropAuthors < ActiveRecord::Migration[5.2]
  def up
    drop_table :authors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
