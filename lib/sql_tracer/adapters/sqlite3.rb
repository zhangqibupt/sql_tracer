module ActiveRecord::ConnectionAdapters
  module SqliteSqlLogger
    def exec_query(sql, name = nil, binds = [], prepare: false)
      sql_info = binds.reduce(sql) do |string, bind|
        string + " ##{bind.name}=#{bind.value_before_type_cast} "
      end
      SqlTracer::SqlLogger.log_sql(sql_info)
      super(sql, name, binds, prepare: prepare)
    end
  end

  class SQLite3Adapter
    prepend SqliteSqlLogger
  end
end
