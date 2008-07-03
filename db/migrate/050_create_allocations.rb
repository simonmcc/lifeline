class CreateAllocations < ActiveRecord::Migration
  def self.up
    create_table :allocations do |t|

      t.column  :user_id,  :integer
      t.column  :client_id,  :integer
      t.column  :allocation_service_id,  :integer
      t.column  :date_intervention_ended,  :date
      t.column  :num_of_intervention_session,  :integer
      t.column  :allocation_service_note,  :string
      t.timestamps
    end
  end

  def self.down
    drop_table :allocations
  end
end
