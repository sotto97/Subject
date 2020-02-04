class RemoveTitleFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :Title, :string
  end
end
