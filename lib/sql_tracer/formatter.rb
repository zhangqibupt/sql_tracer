module SqlTracer
  class Formatter
    HEADER_PROMPT= '='*20 << '>'
    FOOTER_PROMPT= '<' << '='*20

    def self.start_print
      puts HEADER_PROMPT
    end

    def self.end_print
      puts FOOTER_PROMPT
    end

    def self.print_tips
      puts 'SqlTracer is watching and will capture backtrace when sql is executed, '\
      'open [/sql_tracer/index] in browser for detailed information'
    end

    def self.print_sql(sql)
      puts 'SQL:'
      return sql if sql.blank?
      formatted_sql = '  ' << sql
      puts formatted_sql
    end

    def self.print_backtrace(backtrace)
      puts Helper.should_skip_lib? ? 'Backtrace: note that paths in ruby libs have been hidden' : 'Backtrace:'
      backtrace.each do |line|
        (puts '  ' << line) if line.present?
      end
    end

    def self.print_all(sql, backtrace)
      start_print
      print_sql(sql)
      print_backtrace(backtrace)
      end_print
    end

    def self.remove_filtered_path(backtrace)
      backtrace.map do |path|
        next if Helper.shoule_skip_path_by_keywords?(path)
        path
      end.compact
    end
  end
end
