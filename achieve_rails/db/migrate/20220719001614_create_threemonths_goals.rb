class CreateThreemonthsGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :threemonths_goals do |t|
      t.references :user
      t.string :aim
      t.integer :quarter  
      t.timestamps
    end
  end
end
