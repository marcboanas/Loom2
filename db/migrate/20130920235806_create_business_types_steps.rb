class CreateBusinessTypesSteps < ActiveRecord::Migration
  def change
      create_table :business_types_steps, :id => false do |t|
      t.integer :business_type_id
      t.integer :step_id
    end
  end
end
