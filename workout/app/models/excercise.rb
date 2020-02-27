class Excercise < ApplicationRecord
	belongs_to :user

  validates :target, presence: true
  validates :excercise_name, presence: true
  validates :reps, presence: true
  validates :sets, presence: true
end