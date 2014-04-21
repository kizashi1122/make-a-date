class AddPlanToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :plan, :string
  end
end
