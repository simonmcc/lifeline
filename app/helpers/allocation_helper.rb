module AllocationHelper

  def date_intervention_ended_form_column(record, input_name)
    #date_select(record, input_name, :order => [:day, :month, :year], :start_year => 1970, :end_year => Date.today.year-5 )
#    date_select(record, input_name, :order => [:day, :month, :year], :start_year => 1970, :end_year => Date.today.year )
  end
  

end
