class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :port, :integer
    add_column :users, :host, :string
    add_column :users, :db_name, :string
  end
end
