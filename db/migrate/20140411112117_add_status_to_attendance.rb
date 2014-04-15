class AddStatusToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :status, :integer
  end
end
