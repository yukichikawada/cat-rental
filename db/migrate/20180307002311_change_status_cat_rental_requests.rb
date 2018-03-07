class ChangeStatusCatRentalRequests < ActiveRecord::Migration[5.1]
  def change
    change_column :cats_rental_requests, :status, :string, :default => 'PENDING'
  end
end
