class RemoveCommentFromAttendance < ActiveRecord::Migration
  def change
    remove_column :attendances, :comment, :string
  end
end
