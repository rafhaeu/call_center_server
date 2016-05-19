class RemoveClientPhoneFromCalls < ActiveRecord::Migration
  def change
    remove_column :calls, :client_phone_id
  end
end
