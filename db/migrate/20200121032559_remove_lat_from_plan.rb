class RemoveLatFromPlan < ActiveRecord::Migration[5.1]
  def change
    remove_column :plans, :Lat, :float
  end
end
