class AddTitleToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :Title, :string
  end
end
