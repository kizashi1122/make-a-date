class RemoveNameFromAttendance < ActiveRecord::Migration
  def change
    remove_column :attendances, :name, :string
  end
end
