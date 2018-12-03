class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :stone, foreign_key: true
      t.boolean :is_accepted
      t.references :owner, foreign_key: { to_table: :users }, index: true
      t.references :borrower, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
