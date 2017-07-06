require 'active_record/connection_adapters/mysql2_adapter'

module SqlTracer
  module Mysql2SqlLogger
    extend ActiveSupport::Concern
    included do
      alias_method :execute_without_sql_tracer, :execute

      def execute(*args)
        SqlTracer::SqlLogger.log_sql(args.first)
        execute_without_sql_tracer(*args)
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::Mysql2Adapter.send(:include, SqlTracer::Mysql2SqlLogger)

