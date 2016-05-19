class AddClientToCalls < ActiveRecord::Migration
  def change
    add_reference :calls, :client, foreign_key: true, default: nil
  end
end
