class AddIndexes < ActiveRecord::Migration[5.2]
  def up
    add_index :locations, :route_id
    add_index :routes, :journey_id
    add_index :routes, :init_location_id
    add_index :routes, :end_location_id
  end

  def down
    remove_index :locations, column: :route_id
    remove_index :routes, column: :journey_id
    remove_index :routes, column: :init_location_id
    remove_index :routes, column: :end_location_id
  end

end
