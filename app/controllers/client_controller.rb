class ClientController < AuthenticatedApplicationController

  active_scaffold :clients do |config|

    config.columns =  [ :project_id,
                        :name,
                        :mobile,
                        :notes,
                        :address,
                        :town,
                        :post_code,
                        :landline,
                        :gender,
                        :dob,
                        :understoodconfidentiality,
                        :rf_name,
                        :rf_designation,
                        :rf_address,
                        :rf_town,
                        :rf_post_code,
                        :rf_number
                        ]
    
                        
    config.show.columns =  [  :project_id,
                              :id,
                              :name,
                              :mobile,
                              :notes,
                              :address,
                              :town,
                              :post_code,
                              :landline,
                              :gender,
                              :dob,
                              :understoodconfidentiality,
                              :rf_name,
                              :rf_designation,
                              :rf_address,
                              :rf_town,
                              :rf_post_code,
                              :rf_number
                          ]

    config.list.columns =  [:id,
                            :name,
                            :mobile,
                            :notes
                           ]

    config.update.columns =  [:project_id,
                              :name,
                              :address,
                              :town,
                              :post_code,
                              :mobile,
                              :landline,
                              :rf_name,
                              :rf_number,
                              :gender,
                              :notes
                             ]

    # This hides the "Create New" link for the list view
    config.create.link = nil

    config.actions.exclude :delete
    config.show.link.page = true
    config.update.link.page = true
    
    config.columns[:id].label = "Lifeline ID"
    
    config.columns[:project_id].label = "Project ID"

    config.columns[:name].label = "Name"

    config.columns[:gender].form_ui = :select

    config.columns[:notes].form_ui = :textarea
    config.columns[:notes].options = {:rows => 10, :cols => 60}

    config.columns[:understoodconfidentiality].form_ui = :checkbox

    config.columns[:rf_name].label = "Friend/Refer Name"
    config.columns[:rf_number].label = "Friend/Refer Phone Number "
    config.columns[:rf_designation].label = "Friend/Refer Designation"
    config.columns[:rf_address].label = "Friend/Refer Address"
    config.columns[:rf_town].label = "Friend/Refer Town"
    config.columns[:rf_post_code].label = "Friend/Refer Postcode"

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


