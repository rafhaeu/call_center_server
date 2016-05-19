class CreateInternals < ActiveRecord::Migration
  def change
    create_table :internals do |t|
      t.string :name
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
