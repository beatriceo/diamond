class RemoveFirmFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :firm
  end
end
