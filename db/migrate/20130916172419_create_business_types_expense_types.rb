class CreateBusinessTypesExpenseTypes < ActiveRecord::Migration
  def change
      create_table :business_types_expense_types, :id => false do |t|
      t.integer :business_type_id
      t.integer :expense_type_id
    end
  end
end
