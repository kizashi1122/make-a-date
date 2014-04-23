class AddEventIdToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :event_id, :integer
  end
end
