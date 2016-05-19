class AddClientPhoneToCalls < ActiveRecord::Migration
  def change
    add_reference :calls, :client_phone, foreign_key: true
  end
end
