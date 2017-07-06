$:.push File.expand_path('../lib', __FILE__)

# Describe your gem and declare its dependencies:
require "sql_tracer/version"
Gem::Specification.new do |s|
  s.name          = 'sql_tracer'
  s.version       = SqlTracer::VERSION
  s.authors       = ['zhangqibupt']
  s.email         = ['zhangqibuptse@gmail.com']
  s.homepage      = 'https://github.com/zhangqibupt/sql_tracer'
  s.summary       = 'log backtrace when sql is executed'
  s.description   = 'It helps you figure out what sqls are executed and trace method call stack'
  s.files         = Dir['{lib}/**/*','{config}/**/*', '{app}/**/*',]
  s.require_paths = ['lib']
end
