class AddStatusToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :status, :integer
  end
end
