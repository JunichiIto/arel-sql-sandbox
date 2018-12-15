class RemoveAuthorIdFromBooks < ActiveRecord::Migration[5.2]
  def up
    remove_column :books, :author_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
