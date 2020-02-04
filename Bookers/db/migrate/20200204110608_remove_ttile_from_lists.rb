class RemoveTtileFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :ttile, :string
  end
end
