class CreateRoutes < ActiveRecord::Migration[5.2]
  def up
    create_table :routes do |t|
      t.datetime :time_on_location
      t.datetime :arrival_time
      t.references :journey
      

      t.timestamps
    end

    add_reference(:routes, :init_location, index: true)
    add_reference(:routes, :end_location, index: true)
  end

  def down
    remove_reference(:routes, :init_location, index: true)
    remove_reference(:routes, :end_location, index: true)
    drop_table :routes
  end
end

