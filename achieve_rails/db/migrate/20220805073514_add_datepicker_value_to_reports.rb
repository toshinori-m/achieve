class AddDatepickerValueToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :datepicker_value, :string
  end
end
