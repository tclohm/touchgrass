class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pass_rental, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
