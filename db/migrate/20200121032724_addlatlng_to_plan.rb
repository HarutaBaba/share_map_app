class AddlatlngToPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :lat, :float
    add_column :plans, :lng, :float
  end
end
