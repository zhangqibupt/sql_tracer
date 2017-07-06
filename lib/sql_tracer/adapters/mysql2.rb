require 'active_record/connection_adapters/mysql2_adapter'

module ActiveRecord::ConnectionAdapters
  module Mysql2SqlLogger
    def execute(*args)
      SqlTracer::SqlLogger.log_sql(args.first)
      super(*args)
    end
  end

  class Mysql2Adapter
    prepend Mysql2SqlLogger
  end

end

