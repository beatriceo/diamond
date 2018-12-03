class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :firm, :string
  end
end
