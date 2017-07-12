module SqlTracer
  module Config
    DEFAULTS = {
      SQL_TRACER_SKIP_LIB_PATH: true, # method call paths in /.rvm directory won't be output, default true
      SQL_TRACER_CONSOLE_OUTPUT_DISABLED: true, # sqls won't be output in back-end console if set to true
      SQL_TRACER_OUTPUT_SELECT_SQL_ENABLED: false, # output select type sql. By default, only (insert|update|delete) sql will be output
      # sql which contains any element of this array won't be output
      SQL_TRACER_SQL_FILTER: [],
      # request url which contains any element of this array won't be output
      SQL_TRACER_URL_FILTER: [],
      # call stack path which contains any element of this array won't be output
      SQL_TRACER_PATH_FILTER: []
    }.freeze

    def self.get(name)
      @config ||= load_config
      (@config && @config[name.to_s]) ? @config[name.to_s] : DEFAULTS[name]
    end

    private

    def self.load_config
      default_config_file = File.join(Rails.root, 'config', 'sql_tracer.yml')
      ui_config_file = File.join(Rails.root, 'config', 'ui_config.yml')

      config_file = [default_config_file, ui_config_file].find { |file| File.exist?(file) }
      YAML.load_file(config_file) if config_file
    end
  end
end
