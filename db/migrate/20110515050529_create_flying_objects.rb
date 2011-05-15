class CreateFlyingObjects < ActiveRecord::Migration
  def self.up
    create_table :flying_objects do |t|
      t.string :name
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
    drop_table :flying_objects
  end
end
