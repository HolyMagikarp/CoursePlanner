class AddDescriptionColumnToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :description, :string
  end
end
