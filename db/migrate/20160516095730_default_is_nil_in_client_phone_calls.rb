class DefaultIsNilInClientPhoneCalls < ActiveRecord::Migration
  def change
    change_column_default :calls, :client_phone_id, from: 0, to: nil
  end
end
