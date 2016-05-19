class CreateClientPhones < ActiveRecord::Migration
  def change
    create_table :client_phones do |t|
      t.references :client, foreign_key: true
      t.string :phone

      t.timestamps
    end
  end
end
