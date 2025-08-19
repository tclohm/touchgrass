class CreatePassRentals < ActiveRecord::Migration[8.0]
  def change
    create_table :pass_rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
