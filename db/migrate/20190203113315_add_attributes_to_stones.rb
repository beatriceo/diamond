class AddAttributesToStones < ActiveRecord::Migration[5.2]
  def change
    add_column :stones, :clarity, :string
    add_column :stones, :cut, :string
    add_column :stones, :certification_number, :string
  end
end
