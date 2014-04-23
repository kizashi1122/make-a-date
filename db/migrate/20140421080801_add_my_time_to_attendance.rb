class AddMyTimeToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :mytime, :string
  end
end
