class CreateTrajectories < ActiveRecord::Migration
  def self.up
    create_table :trajectories do |t|
      t.integer :flying_object_id
      t.string :created_by
      t.float :start_lat
      t.float :start_lon
      t.float :aim_lat
      t.float :aim_lon
      t.float :speed

      t.timestamps
    end
  end

  def self.down
    drop_table :trajectories
  end
end
