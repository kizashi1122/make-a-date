class RemovePlanFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :plan, :string
  end
end
