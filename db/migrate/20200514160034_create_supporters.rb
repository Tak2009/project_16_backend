class CreateSupporters < ActiveRecord::Migration[6.0]
  def change
    create_table :supporters do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end
