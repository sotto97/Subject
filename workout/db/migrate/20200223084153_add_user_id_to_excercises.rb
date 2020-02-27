class AddUserIdToExcercises < ActiveRecord::Migration[5.2]
  def change
    add_column :excercises, :user_id, :integer
  end
end
