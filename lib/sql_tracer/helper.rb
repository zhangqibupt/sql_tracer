
module SqlTracer
  class Helper

    class << self
      def output_select_sql_enabled?
        @output_select_sql_enabled ||= config.get(:SQL_TRACER_OUTPUT_SELECT_SQL_ENABLED)
      end

      def should_skip_lib?
        @should_skip_lib ||= config.get(:SQL_TRACER_SKIP_LIB_PATH)
      end

      def should_skip_sql_by_keywords?(sql)
        @sql_keywords ||= config.get(:SQL_TRACER_SQL_FILTER)
        @sql_keywords.any? { |keyword| sql.include?(keyword) }
      end

      def should_skip_url_by_keywords?(url)
        @url_keywords ||= config.get(:SQL_TRACER_URL_FILTER)
        @url_keywords.any? { |keyword| url.include?(keyword) }
      end

      def shoule_skip_path_by_keywords?(path)
        @path_keywords ||= build_path_filter
        @path_keywords.any? { |keyword| path.include?(keyword) }
      end

      def disable_console_output?
        @console_output_disabled ||= config.get(:SQL_TRACER_CONSOLE_OUTPUT_DISABLED)
      end

      def should_output_sql?(sql)
        reg = 'insert|update|delete'
        reg << '|select' if Helper.output_select_sql_enabled?
        return sql =~ /^\s*(#{reg})\s/i && !Helper.should_skip_sql_by_keywords?(sql)
      end

      private

      def build_path_filter
        path_filter = (config.get(:SQL_TRACER_PATH_FILTER) || [])
        path_filter << '/.rvm/gems/' if Helper.should_skip_lib?
        path_filter.uniq
      end

      def config
        SqlTracer::Config
      end
    end
  end
end
