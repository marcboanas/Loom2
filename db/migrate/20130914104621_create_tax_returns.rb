class CreateTaxReturns < ActiveRecord::Migration
  def change
    create_table :tax_returns do |t|
      t.integer :user_id
      t.float :loss
      t.float :pension
      t.string :UTR
      t.float :dividend
      t.float :interest

      t.timestamps
    end
  end
end
