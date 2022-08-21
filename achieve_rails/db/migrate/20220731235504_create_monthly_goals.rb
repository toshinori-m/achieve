class CreateMonthlyGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_goals do |t|
      t.references :user
      t.string :aim
      t.timestamps
    end
  end
end
