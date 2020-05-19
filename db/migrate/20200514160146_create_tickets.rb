class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :message
      t.references :pub, null: false, foreign_key: true
      t.references :supporter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
