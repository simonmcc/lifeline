class ClientController < AuthenticatedApplicationController
  layout 'application'
  
  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  active_scaffold :clients do |config|

    config.columns =  [:fname,
                        :sname,
                        :mobile,
                        :notes,
                        :address,
                        :town,
                        :post_code,
                        :landline,
                        :fr_fname,
                        :fr_sname,
                        :fr_number,
                        :gender,
			:dob,
                        :understoodconfidentiality,
                        :rf_fname,
                        :rf_sname,
                        :rf_designation,
                        :rf_address,
                        :rf_town,
                        :rf_post_code,
                        :rf_number
                        ]

    config.list.columns =  [:fname,
                            :sname,
                            :mobile,
                            :notes
                           ]

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

    # This hides the "Create New" link for the list view
    config.create.link = nil
   
    config.actions.exclude :delete
    config.show.link.page = true
    config.update.link.page = true

    config.columns[:fname].label = "Forename"
    config.columns[:sname].label = "Surname"

    config.columns[:fr_fname].label = "Friend/Refer Forename"
    config.columns[:fr_sname].label = "Friend/Refer Surname"

    config.columns[:gender].form_ui = :select
    
    
    config.columns[:notes].form_ui = :textarea
    config.columns[:notes].options = {:rows => 10, :cols => 60}

    config.columns[:understoodconfidentiality].form_ui = :checkbox

    #config.columns[:full_assessment].label = "Was a full assessment completed?"
    #config.columns[:full_assessment].form_ui = :select

  end

  def show
    @client = client_from_params()
    return redirect(:action=>'index') if @client.nil?
  end

  def client_from_params(param_name = :id)
    client_id = ((params[param_name] || ' ').gsub(/\D/, ''))
    client = Client.find(client_id) if client_id[/^\d{1,6}/]
    return client
  end

end


