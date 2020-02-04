class RemoveTileFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :Tile, :string
  end
end
