class ChangePlanTitleTimeStatusLatLngNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :plans, :title, false
    change_column_null :plans, :time, false
    change_column_null :plans, :status, false
    change_column_null :plans, :lat, false
    change_column_null :plans, :lng, false
  end
end
