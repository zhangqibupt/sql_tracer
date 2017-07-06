module SqlLogging
  class Railtie < Rails::Railtie
    initializer 'sql_logging.load_adapter_extensions' do
      ActiveSupport.on_load(:active_record, :after => 'active_record.initialize_database') do
        adapter = ActiveRecord::Base.configurations[Rails.env]['adapter']
        begin
          require "sql_tracer/adapters/#{adapter}"
          SqlTracer::Formatter.print_tips
        rescue LoadError => e
          Rails.logger.error('Failed to injuect SqlTracer to ActiveRecord due to :' + e.message)
        end
      end
    end


    initializer 'sql_logging.load_adapter_extensions' do
      begin
        ActiveSupport.on_load(:action_controller) do
          ActionController::Base.send(:include, SqlTracer::RequestLogger)
        end
      rescue LoadError, NameError => e
        Rails.logger.error('Failed to injuect RequestLogger to Controller due to :' + e.message)
      end
    end
  end
end
