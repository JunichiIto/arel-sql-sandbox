class AddAuthorNameAndAuthorEmailToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author_name, :string
    add_column :books, :author_email, :string
  end
end
