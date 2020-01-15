class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string "name"
      t.string "title"
      t.string "time"
      t.string "sankaname"
      t.string "syotainame"
      t.boolean "status"

      t.timestamps
    end
  end
end