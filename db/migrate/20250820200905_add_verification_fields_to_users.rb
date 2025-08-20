class AddVerificationFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :phone_verified, :boolean
    add_column :users, :government_id_verified, :boolean
    add_column :users, :verification_notes, :text
  end
end
