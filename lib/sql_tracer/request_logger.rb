module SqlTracer
  module RequestLogger
    extend ActiveSupport::Concern
    included do
      after_filter :persist_reqeust_logger

      def persist_reqeust_logger
        begin
          if SqlTracer::Helper.should_skip_url_by_keywords?(request.path)
            SqlTracer::SqlStack.abandon_request
          else
            # Processed by #{self.class} ##{params[:action]}
            SqlTracer::SqlStack.push("#{request.method} #{request.path} ")
          end
        rescue => e
          Rails.logger.error "Failed to log sql in SqlTracer. Error: #{e.message}"
          Rails.logger.error e.backtrace.join("\n")
        end
      end
    end
  end
end
