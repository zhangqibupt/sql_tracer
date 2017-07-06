Getting Started
-------------------
Quick Demo
[![stack tracer](http://i2.kiimg.com/1949/fe060b70c2ad8d68.jpg)](http://recordit.co/8gnv8OR8vn)

It is very easy to get started:
1. Add `gem 'sql_tracer'` to your Gemfile
2. (optional) copy below config to `config/sql_tracer.yml`, create it if necessary
3. `bundle install`
4. `rails s` and you can see a prompt  '*SqlTracer is watching and will capture backtrace when sql is executed*', which means sql tracer is up
5. Open '/sql_tracer/index' in the browser, `http://127.0.0.1:3000/sql_tracer/index` e.g.
6. (optional) to quick jump between backtrace stack paths, wish this sublime3 plugin could help. https://github.com/zhangqibupt/stacktracer

To acquire advanced features, you can add config to `config/sql_tracer.yml`(default) to acquire advanced features.
```
SQL_TRACER_SKIP_LIB_PATH: true                   # method call paths in /.rvm directory won't be output, default true
SQL_TRACER_CONSOLE_OUTPUT_DISABLED: true    # sqls won't be output in back-end console if set to true, default false
SQL_TRACER_OUTPUT_SELECT_SQL_ENABLED: true  # output select type sql. By default, only (insert|update|delete) sql will be output

# sql which contains any element of this array won't be output
SQL_TRACER_SQL_FILTER: ["UPDATE `sso_token`", "INSERT INTO `sso_token`"]

# request url which contains any element of this array won't be output
SQL_TRACER_URL_FILTER: ["system/inbox_messages/notify"]

# call stack path which contains any element of this array won't be output
SQL_TRACER_PATH_FILTER: ["script/rails:6", "/lib/middlewares/"]
```

Note that
only sqlite3 and mysql are supported for now.
multi-thread servers (unicorn e.g.) are not supported. 


