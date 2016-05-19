class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :phone
      t.datetime :called_at
      t.integer :duration
      t.references :internal, foreign_key: true
      t.references :call_type, foreign_key: true
      t.integer :rings

      t.timestamps
    end
  end
end
