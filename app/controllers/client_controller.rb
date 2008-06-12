class ClientController < ApplicationController
  layout 'application'
  
  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  active_scaffold :clients do |config|

    config.columns =  [:fname,
                        :sname,
                        :mobile,
                        :notes,
                        :call,
                        :call_out,
                        :client_history]

    config.list.columns =  [:fname,
                            :sname,
                            :mobile,
                            :notes,
                            :call,
                            :call_out,
                            :client_history]

    config.update.columns =  [:fname,
                              :sname,
                              :address,
                              :town,
                              :post_code,
                              :mobile,
                              :landline,
                              :fr_fname,
                              :fr_sname,
                              :fr_number,
                              :gender,
                              :notes


                             ]

    config.columns[:fname].label = "Forename"
    config.columns[:sname].label = "Surname"

    config.columns[:fr_fname].label = "Friend/Refer Forename"
    config.columns[:fr_sname].label = "Friend/Refer Surname"

    config.columns[:call].label = "Friend/Refer Surname"
    config.columns[:gender].form_ui = :select


  end


end
