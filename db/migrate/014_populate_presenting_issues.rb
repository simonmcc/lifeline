class PopulatePresentingIssues < ActiveRecord::Migration
  def self.up
    PresentingIssue.create(:code => '1.01', :issue => 'Abuse - Physical')
    PresentingIssue.create(:code => '1.02', :issue => 'Abuse - Emotional')
    PresentingIssue.create(:code => '1.03', :issue => 'Abuse - Sexual')
  end

  def self.down
  end
end
