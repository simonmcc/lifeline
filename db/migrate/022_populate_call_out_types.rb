class PopulateCallOutTypes < ActiveRecord::Migration
  def self.up
    CallOutType.create(:name => "Immediate Call back to caller requested/Call Interrupted")
    CallOutType.create(:name => "Response to Third Party Referral (Call to Service User)")
    CallOutType.create(:name => "Follow up Assessment Appointment with Service User")
    CallOutType.create(:name => "Contracted check in appointment with service user")
    CallOutType.create(:name => "Contracted Telephone Appointment")
    CallOutType.create(:name => "Assessment follow up with service user")
    CallOutType.create(:name => "Assessment follow up with parent/friend/relative")
    CallOutType.create(:name => "Assessment follow up referrer ")
    CallOutType.create(:name => "Assessment follow up with GP (normal hours)")
    CallOutType.create(:name => "Assessment follow up with Social Services (normal hours)")
    CallOutType.create(:name => "Assessment follow up with Mental Health Services (normal hours)")
    CallOutType.create(:name => "Assessment follow up with GP (out of hours)")
    CallOutType.create(:name => "Assessment follow up with Social Services (out of hours)")
    CallOutType.create(:name => "Assessment follow up with Mental Health Services (out of hours)")
    CallOutType.create(:name => "Clinical Consult")
    CallOutType.create(:name => "Referral to Emergency Services")
    CallOutType.create(:name => "Referral to GP")
    CallOutType.create(:name => "Referral to Social Services")
    CallOutType.create(:name => "Referral to Other Professional", :freetext => true)
    CallOutType.create(:name => "Referral to Voluntary/Community Organisation", :freetext => true)
    CallOutType.create(:name => "Allocation follow up to LIFELINE services")
  end

  def self.down
  end
end
