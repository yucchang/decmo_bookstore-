class AddTransactionId < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :transction_id, :string 
  end
end
