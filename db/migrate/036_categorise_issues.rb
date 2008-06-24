class CategoriseIssues < ActiveRecord::Migration
  def self.up
    # Find each of the categories & assign the correct category
    personalissues = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '1%'])
    personalissues.each {|i| i.category = "Personal Issues" ; i.save}
    
    stwi = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '2%'])
    stwi.each {|i| i.category = "School/Training/Work Issues" ; i.save}
    
    sm = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '3%'])
    sm.each {|i| i.category = "Substance Misuse" ; i.save}
    
    nic = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '4%'])
    nic.each {|i| i.category = "Victims of the NI Conflict" ; i.save}
    
    other = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '5%'])
    other.each {|i| i.category = "Other" ; i.save}
    
  end

  def self.down
  end
end
