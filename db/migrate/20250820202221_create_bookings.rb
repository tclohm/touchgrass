class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pass_rental, null: false, foreign_key: true
      t.string :status
      t.decimal :security_deposit
      t.string :deposit_status
      t.boolean :government_id_verified
      t.boolean :phone_verified

      t.timestamps
    end
  end
end
