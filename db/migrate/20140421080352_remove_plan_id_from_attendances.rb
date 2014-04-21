class RemovePlanIdFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :plan_id, :integer
  end
end
