class AddPlanToEvent < ActiveRecord::Migration
  def change
    add_column :events, :plan, :string
  end
end
