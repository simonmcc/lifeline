class CreateFollowupServices < ActiveRecord::Migration
  def self.up
    create_table :followup_services do |t|
      t.column "name", :string
      t.column "freetext", :boolean, :default => false
      t.column "freetext_desc", :string

      t.timestamps
    end

    FollowupService.create(:name => "Yes - LIFELINE SERVICES Counselling",
                           :freetext => true,
                           :freetext_desc => "Name of counsellor/organisation, date of initial appointment")

    FollowupService.create(:name => "Yes - LIFELINE SERVICES Mentoring/Befriending",
                           :freetext => true,
                           :freetext_desc => "Name of counsellor/organisation, date of initial appointment")

    FollowupService.create(:name => "Yes - LIFELINE SERVICES Complimentary Therapies",
                           :freetext => true,
                           :freetext_desc => "Name of organisation, date of initial appointment")

    FollowupService.create(:name => "Yes - CONTACT YOUTH PROJECT",
                           :freetext => true,
                           :freetext_desc => "Name of project")

    FollowupService.create(:name => "Yes - referral to outside organisation/service",
                           :freetext => true,
                           :freetext_desc => "Name of organisation/service")

    FollowupService.create(:name => "No - follow up action agreed",
                           :freetext => true,
                           :freetext_desc => "time & date")

    FollowupService.create(:name => "No - no follow up required",
                           :freetext => true,
                           :freetext_desc => "reason")
  end

  def self.down
    drop_table :followup_services
  end
end
