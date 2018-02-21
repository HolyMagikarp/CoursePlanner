class AddCourseToCredit < ActiveRecord::Migration[5.1]
  def change
    add_reference :credits, :course, foreign_key: true
  end
end
