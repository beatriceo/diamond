class CreateStones < ActiveRecord::Migration[5.2]
  def change
    create_table :stones do |t|
      t.references :owner, foreign_key: { to_table: :users }, index: true
      t.string :color
      t.string :carat
      t.boolean :is_borrowed

      t.timestamps
    end
  end
end
