class CreateProgramRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :program_requirements do |t|
      t.string :name

      t.timestamps
    end
  end
end
