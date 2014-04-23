class RemoveUserIdFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :user_id, :integer
  end
end
