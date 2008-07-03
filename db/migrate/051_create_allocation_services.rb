class CreateAllocationServices < ActiveRecord::Migration
  def self.up
    create_table :allocation_services do |t|
      t.column  :service_text,  :string
      t.timestamps
    end

    AllocationService.create(:service_text => "CHILL Eastern")
    AllocationService.create(:service_text => "CHILL Western")
    AllocationService.create(:service_text => "Northern Board")
    AllocationService.create(:service_text => "Clinical Placements")
    AllocationService.create(:service_text => "Schools Programme")
    AllocationService.create(:service_text => "Lifeline Counselling")
    AllocationService.create(:service_text => "Lifeline Mentoring/Befriending")
    AllocationService.create(:service_text => "Lifeline Complimentary Therapies")
  
  end

  def self.down
    drop_table :allocation_services
  end
end
