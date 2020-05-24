class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :message
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.string :postcode

      t.references :pub, null: false, foreign_key: true
      # t.references :supporter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
