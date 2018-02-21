class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :name
      t.integer :breadth
      t.float :credit_value

      t.timestamps
    end
  end
end
