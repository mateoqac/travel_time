class CreateLocations < ActiveRecord::Migration[5.2]
  def up
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer "route_id"

      t.timestamps
    end
  end

  def down
    drop_table :locations
  end
end
