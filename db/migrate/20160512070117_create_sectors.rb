class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
