class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.references :stone, foreign_key: true
      t.references :owner, foreign_key: { to_table: :users }, index: true
      t.references :borrower, foreign_key: { to_table: :users }, index: true
      t.string :signature

      t.timestamps
    end
  end
end
