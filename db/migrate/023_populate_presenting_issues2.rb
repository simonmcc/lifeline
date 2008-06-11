class PopulatePresentingIssues2 < ActiveRecord::Migration
  def self.up
    PresentingIssue.create(:code => '1.04', :issue => 'Abortion')
    PresentingIssue.create(:code => '1.05', :issue => 'Adoption')
    PresentingIssue.create(:code => '1.06', :issue => 'Anger')
    PresentingIssue.create(:code => '1.07', :issue => 'Anxiety')
    PresentingIssue.create(:code => '1.08', :issue => 'Bereavement')
    PresentingIssue.create(:code => '1.09', :issue => 'Carer Responsibilities')
    PresentingIssue.create(:code => '1.1', :issue => 'Depression')
    PresentingIssue.create(:code => '1.11', :issue => 'Domestic Violence')
    PresentingIssue.create(:code => '1.12', :issue => 'Eating Issues')
    PresentingIssue.create(:code => '1.13', :issue => 'Family Conflict')
    PresentingIssue.create(:code => '1.14', :issue => 'Family Illness')
    PresentingIssue.create(:code => '1.15', :issue => 'Family Breakdown')
    PresentingIssue.create(:code => '1.16', :issue => 'Gambling')
    PresentingIssue.create(:code => '1.17', :issue => 'Health - Physical')
    PresentingIssue.create(:code => '1.18', :issue => 'Health - Mental')
    PresentingIssue.create(:code => '1.19', :issue => 'Housing - General')
    PresentingIssue.create(:code => '1.2', :issue => 'Housing - Being in Care')
    PresentingIssue.create(:code => '1.21', :issue => 'Isolation')
    PresentingIssue.create(:code => '1.22', :issue => 'Information')
    PresentingIssue.create(:code => '1.23', :issue => 'Leaving Home')
    PresentingIssue.create(:code => '1.24', :issue => 'Neglect')
    PresentingIssue.create(:code => '1.25', :issue => 'Obesity')
    PresentingIssue.create(:code => '1.26', :issue => 'Obsessive Compulsive Disorder')
    PresentingIssue.create(:code => '1.27', :issue => 'Panic Attacks')
    PresentingIssue.create(:code => '1.28', :issue => 'Pregnancy')
    PresentingIssue.create(:code => '1.29', :issue => 'Racism')
    PresentingIssue.create(:code => '1.3', :issue => 'Rape')
    PresentingIssue.create(:code => '1.31', :issue => 'Relationships')
    PresentingIssue.create(:code => '1.32', :issue => 'Relationship with Parent/Carer')
    PresentingIssue.create(:code => '1.33', :issue => 'Self Esteem')
    PresentingIssue.create(:code => '1.34', :issue => 'Self Harm')
    PresentingIssue.create(:code => '1.35', :issue => 'Sexual Health')
    PresentingIssue.create(:code => '1.36', :issue => 'Sexuality')
    PresentingIssue.create(:code => '1.37', :issue => 'Suicide ')
    PresentingIssue.create(:code => '1.38', :issue => 'Suicide - Concerned about')
    PresentingIssue.create(:code => '1.39', :issue => 'Unemployed')
    PresentingIssue.create(:code => '1.4', :issue => 'Victim of Violence')
    PresentingIssue.create(:code => '1.41', :issue => 'Traumatic Bereavement')
    PresentingIssue.create(:code => '1.42', :issue => 'Suicidal Bereavement')
    PresentingIssue.create(:code => '1.44', :issue => 'Concerned about Self Harm')
    PresentingIssue.create(:code => '2.01', :issue => 'Absence/Attendance')
    PresentingIssue.create(:code => '2.02', :issue => 'Bullying')
    PresentingIssue.create(:code => '2.03', :issue => 'Changes at School')
    PresentingIssue.create(:code => '2.04', :issue => 'Career')
    PresentingIssue.create(:code => '2.05', :issue => 'Disciplinary')
    PresentingIssue.create(:code => '2.06', :issue => 'Exam Pressure')
    PresentingIssue.create(:code => '2.07', :issue => 'Hate School')
    PresentingIssue.create(:code => '2.08', :issue => 'Relationship with Teacher')
    PresentingIssue.create(:code => '3.01', :issue => 'Beer/Lager')
    PresentingIssue.create(:code => '3.02', :issue => 'Spirits')
    PresentingIssue.create(:code => '3.03', :issue => 'Amphetamines')
    PresentingIssue.create(:code => '3.04', :issue => 'Cannabis')
    PresentingIssue.create(:code => '3.05', :issue => 'Cocaine')
    PresentingIssue.create(:code => '3.06', :issue => 'Ecstacy')
    PresentingIssue.create(:code => '3.07', :issue => 'Heroin')
    PresentingIssue.create(:code => '3.08', :issue => 'LSD')
    PresentingIssue.create(:code => '3.09', :issue => 'Prescription')
    PresentingIssue.create(:code => '3.1', :issue => 'Over The Counter Meds')
    PresentingIssue.create(:code => '3.11', :issue => 'Solvents')
    PresentingIssue.create(:code => '3.13', :issue => 'Friend')
    PresentingIssue.create(:code => '3.14', :issue => 'Parents/ Family')
    PresentingIssue.create(:code => '4.01', :issue => 'Bereaved')
    PresentingIssue.create(:code => '4.02', :issue => 'Emotionally injured')
    PresentingIssue.create(:code => '4.03', :issue => 'Physically injured')
    PresentingIssue.create(:code => '4.04', :issue => 'Witness')
    PresentingIssue.create(:code => '5.01', :issue => 'Joy Riding')
    PresentingIssue.create(:code => '5.02', :issue => 'Violent Behaviour')
    PresentingIssue.create(:code => '5.03', :issue => 'Theft')
    PresentingIssue.create(:code => '5.04', :issue => 'Other (please specify):')
    PresentingIssue.create(:code => '5.05', :issue => 'Involvement with Probation')
    PresentingIssue.create(:code => '5.06', :issue => 'Involvement with Juvenile Justice')
    PresentingIssue.create(:code => '5.07', :issue => 'Trauma')
    PresentingIssue.create(:code => '5.08', :issue => 'Homelessness')
  end

  def self.down
  end
end
