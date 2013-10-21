class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :expense
      t.integer :expense_category_id

      t.timestamps
    end
  end
end
