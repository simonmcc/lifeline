class CreateCallOuts < ActiveRecord::Migration
  def self.up
    create_table :call_outs do |t|
      t.column	:time_of_call,	            :datetime
      t.column  :client_id,	                :integer
      t.column	:call_outcome_id,	        :integer
      t.column	:call_out_type_id,	        :integer
      t.column	:call_out_type_freetext,	:string
      t.column	:notes,		                :string

      t.timestamps
    end
  end

  def self.down
    drop_table :call_outs
  end
end
