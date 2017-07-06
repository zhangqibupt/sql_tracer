module SqlTracer
  module SqlLogger
    def self.log_sql(sql)
      begin
        if Helper.should_output_sql?(sql)
          backtrace = Thread.current.backtrace
          backtrace = Formatter.remove_filtered_path(backtrace)
          Formatter.print_all(sql, backtrace) unless Helper.disable_console_output?
          SqlTracer::SqlStack.sql_stack << { :sql => sql, :stack => backtrace }
        end
      rescue => e
        Rails.logger.error "Failed to log sql in SqlTracer. Error: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end
end
