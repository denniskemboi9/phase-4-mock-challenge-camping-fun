class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.references :camper, foreign_key: true
      t.references :activity, foreign_key: true
      t.integer :time
      t.timestamps
    end
  end
end
