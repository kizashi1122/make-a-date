class RemoveStatusFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :status, :integer
  end
end
