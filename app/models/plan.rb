class Plan < ApplicationRecord
  has_many :userplans
  has_many :users, through: :userplans
end
