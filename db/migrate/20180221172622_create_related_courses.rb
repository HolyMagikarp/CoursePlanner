class CreateRelatedCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :related_courses do |t|
      t.references :course, foreign_key: true
      t.string :type, null: false
      t.string :related_courses
      
      t.timestamps
    end
  end
end
