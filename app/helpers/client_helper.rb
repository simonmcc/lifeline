module ClientHelper

  def clinical_consultation_required_form_column(record, input_name)
    select("record", "clinical_consultation_required", [['Yes', true ], ['No',  false ]],
              { :selected => @record.clinical_consultation_required, :prompt => true  })
  end

  def dob_form_column(record, input_name)
    #date_select(record, input_name, :order => [:day, :month, :year], :start_year => 1970, :end_year => Date.today.year-5 )
    date_select  :record, 'dob', :order => [:day, :month, :year], :start_year => 1970, :end_year => Date.today.year 
  end

end
