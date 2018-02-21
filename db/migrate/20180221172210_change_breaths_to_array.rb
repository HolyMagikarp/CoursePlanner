class ChangeBreathsToArray < ActiveRecord::Migration[5.1]
  def up
    change_column :courses, :breadth, :string
  end

  def down
    change_column :courses, :breadth, :integer
  end
end
