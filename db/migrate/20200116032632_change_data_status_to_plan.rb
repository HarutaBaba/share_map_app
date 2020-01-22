class ChangeDataStatusToPlan < ActiveRecord::Migration[5.1]
  def change
    change_column :plans, :status, :string
  end
end
