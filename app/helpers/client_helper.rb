module ClientHelper

  def clinical_consultation_required_form_column(record, input_name)
    select("record", "clinical_consultation_required", [['Yes', true ], ['No',  false ]],
              { :selected => @record.clinical_consultation_required, :prompt => true  })
  end



end
