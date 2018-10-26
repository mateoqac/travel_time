class CreateRoutes < ActiveRecord::Migration[5.2]
  def up
    create_table :routes do |t|
      t.integer "journey_id"
      t.integer "init_location_id"
      t.integer "end_location_id"
      t.datetime :time_on_location
      t.datetime :arrival_time
      
      t.timestamps
    end
  end

  def down
    drop_table :routes
  end
end

