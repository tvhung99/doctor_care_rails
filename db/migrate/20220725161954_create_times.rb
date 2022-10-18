class CreateTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :times do |t|
      t.string :time
      t.timestamps
    end
  end
end
