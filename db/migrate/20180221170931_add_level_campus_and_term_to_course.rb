class AddLevelCampusAndTermToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :level, :string
    add_column :courses, :campus, :string
    add_column :courses, :term, :string
  end
end
