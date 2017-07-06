module SqlTracer
  class SqlTracerController < ActionController::Base
    skip_filter :build_navigations
    skip_after_filter :persist_reqeust_logger

    def index
    end

    def get_latest_stack_info
      ret = SqlTracer::SqlStack.to_json
      SqlTracer::SqlStack.clear
      render :json => ret
    end
  end
end
