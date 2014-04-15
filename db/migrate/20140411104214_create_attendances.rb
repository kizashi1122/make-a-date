class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :name
      t.integer :plan_id

      t.timestamps
    end
  end
end
