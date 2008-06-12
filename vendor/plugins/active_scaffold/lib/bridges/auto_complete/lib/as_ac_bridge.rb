module ActiveScaffold::Config
  class Core < Base

    def initialize_with_auto_complete(model_id)
      initialize_without_auto_complete(model_id)
      
      # calendar_date_select_fields = self.model.columns.collect{|c| c.name.to_sym if [:date, :datetime].include?(c.type) }.compact
      # # check to see if file column was used on the model
      # return if calendar_date_select_fields.empty?
      # 
      # # automatically set the forum_ui to a file column
      # calendar_date_select_fields.each{|field|
      #   self.columns[field].form_ui = :calendar_date_select
      # }
    end
    
    alias_method_chain :initialize, :auto_complete
    
  end
end

module ActiveScaffold
  module Helpers
    # Helpers that assist with the rendering of a Form Column
    module FormColumns
      def active_scaffold_input_auto_complete(column, options)
        belongs_to_auto_completer :record, column.name, :id, options
      end      
    end
  end
end

module ActiveScaffold
  module Helpers
    module ViewHelpers

      # def active_scaffold_includes_with_auto_complete
      #   active_scaffold_includes_without_auto_complete + 
      #     auto_complete_includes
      # end
      # 
      # alias_method_chain :active_scaffold_includes, :auto_complete
    end
  end
end
