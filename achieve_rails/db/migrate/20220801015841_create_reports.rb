class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user
      t.text :report
      t.text :point
      t.string :location
      t.string :time
      t.string :condition
      t.string :intensity
      t.timestamps
    end
  end
end
