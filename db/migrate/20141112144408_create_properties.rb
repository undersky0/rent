class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    t.integer  "user_id"
    t.decimal  "cost",        precision: 20, scale: 2
    t.decimal  "currentrent", precision: 20, scale: 2

      t.timestamps
    end
  end
end
