class CreatePubs < ActiveRecord::Migration[6.0]
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end