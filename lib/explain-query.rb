$:.unshift File.dirname(__FILE__)

module ExplainQuery
  VERSION = '0.1.1'
end

if defined?(ActiveRecord::ConnectionAdapters::MysqlAdapter)
  require 'explain-query/explain-query' 

  Array.send                                           :include, ExplainQuery::ArrayExt
  ActiveRecord::ConnectionAdapters::MysqlAdapter.send  :include, ExplainQuery::MysqlAdapterExt
  ActiveRecord::Base.send                              :extend,  ExplainQuery::Watcher
end
