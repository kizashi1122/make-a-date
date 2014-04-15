class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :datetime
      t.integer :event_id

      t.timestamps
    end
  end
end
