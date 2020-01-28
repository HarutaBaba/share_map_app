class CreateUserplans < ActiveRecord::Migration[5.1]
  def change
    create_table :userplans do |t|
      t.references :user, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
