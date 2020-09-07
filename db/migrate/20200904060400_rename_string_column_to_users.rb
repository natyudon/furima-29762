class RenameStringColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :string, :last_name
  end
end
