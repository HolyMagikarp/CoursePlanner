class CreateJoinTableUsersPrograms < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :programs do |t|
      # t.index [:user_id, :program_id]
      # t.index [:program_id, :user_id]
    end
  end
end
