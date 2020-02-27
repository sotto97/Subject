class CreateExcercises < ActiveRecord::Migration[5.2]
  def change
    create_table :excercises do |t|
      t.string :target
      t.string :excercise_name
      t.integer :reps
      t.integer :sets

      t.timestamps
    end
  end
end
