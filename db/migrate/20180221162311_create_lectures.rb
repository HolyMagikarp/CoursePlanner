class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :lecture_code
      t.string :location
      t.string :professor
      t.string :day
      t.time :start_time
      t.time :end_time
      t.time :duration

      t.timestamps
    end
  end
end
