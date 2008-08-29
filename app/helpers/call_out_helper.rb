module CallOutHelper

 def time_of_call_form_column(record, input_name)
       #date_select(record, input_name, :order => [:day, :month, :year], :start_year => 1970, :end_year => Date.today.year-5 )
       datetime_select  :record, 'time_of_call', :order => [:day, :month, :year], :date => Date.today 
         end
   
end
