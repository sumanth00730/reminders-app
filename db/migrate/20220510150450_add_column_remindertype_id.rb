class AddColumnRemindertypeId < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :reminder_type_id, :int
  end
end
