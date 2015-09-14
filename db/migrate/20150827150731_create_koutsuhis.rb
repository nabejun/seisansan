class CreateKoutsuhis < ActiveRecord::Migration
  def change
    create_table :koutsuhis do |t|

      t.string :user_id
      t.date :seisan_date
      t.string :route_from
      t.string :route_to
      t.integer :price
      t.string :memo
      t.string :seisan_month
      t.timestamps null: false
    end
  end
end
