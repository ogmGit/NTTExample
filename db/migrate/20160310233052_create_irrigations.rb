class CreateIrrigations < ActiveRecord::Migration
  def change
    create_table :irrigations do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
