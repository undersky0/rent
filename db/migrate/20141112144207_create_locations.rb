class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    t.string   "address"
    t.string   "google_address"
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.integer  "property_id"
      t.timestamps
    end
  end
end
