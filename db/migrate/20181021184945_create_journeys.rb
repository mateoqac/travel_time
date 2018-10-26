class CreateJourneys < ActiveRecord::Migration[5.2]
  def up
    create_table :journeys do |t|
      t.string :name, null: false
      t.datetime :leaving_time, null: false

      t.timestamps
    end
  end

  def down
    drop_table :journeys
  end
end
