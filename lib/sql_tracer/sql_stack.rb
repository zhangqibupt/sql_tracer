module SqlTracer
  class SqlStack
    @sql_stack = [] # used to store current request information
    @sql_stacks = [] # used to store all requests before taken by SqlTracerController#get_latest_stack_info

    class << self
      attr_accessor :sql_stack, :sql_stacks

      def clear
        @sql_stacks = []
      end

      def push(url_info)
        @sql_stacks << { :url => "[#{Time.now.strftime('%H:%M:%S')}] #{url_info}", :sqls => @sql_stack }
        @sql_stack = []
      end

      def to_json
        @sql_stacks.to_json
      end

      def abandon_request
        @sql_stack = []
      end
    end
  end
end
