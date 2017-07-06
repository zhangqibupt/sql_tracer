require 'sql_tracer/engine'
require 'sql_tracer/railtie'

module SqlTracer
  autoload :RequestLogger, 'sql_tracer/request_logger'
  autoload :SqlLogger, 'sql_tracer/sql_logger'
  autoload :SqlStack, 'sql_tracer/sql_stack'
  autoload :Railtie, 'sql_tracer/railtie'
  autoload :Helper, 'sql_tracer/helper'
  autoload :Formatter, 'sql_tracer/formatter'
  autoload :Config, 'sql_tracer/config'
end

