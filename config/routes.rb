Rails.application.routes.draw do
  get '/sql_tracer/index' => 'sql_tracer/sql_tracer#index'
  get '/sql_tracer/get_latest_stack_info' => 'sql_tracer/sql_tracer#get_latest_stack_info'
end
