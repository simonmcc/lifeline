module AllocationHelper

  def date_intervention_ended_form_column(record, input_name)
    #date_select(record, input_name, :order => [:day, :month, :year], :start_year => 1970, :end_year => Date.today.year-5 )
    date_select :record, 'date_intervention_ended', :order => [:day, :month, :year], :end_year => 2020, :start_year => Date.today.year, :include_blank => true

    #date_select  :record, 'dob', :order => [:day, :month, :year], :start_year => 1970, :end_year => Date.today.year

  end
  

end
