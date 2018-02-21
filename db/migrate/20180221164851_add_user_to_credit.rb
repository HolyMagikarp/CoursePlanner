class AddUserToCredit < ActiveRecord::Migration[5.1]
  def change
    add_reference :credits, :user, foreign_key: true
  end
end
