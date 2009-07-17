module ExplainQuery
  module ArrayExt
    protected
    def qa_columnized_row(fields, sized)
      row = []
      fields.each_with_index do |f, i|
        row << sprintf("%0-#{sized[i]}s", f.to_s)
      end
      row.join(' | ')
    end

    public

    def qa_columnized
      sized = {}
      self.each do |row|
        row.values.each_with_index do |value, i|
          sized[i] = [sized[i].to_i, row.keys[i].length, value.to_s.length].max
        end
      end

      table = []
      table << qa_columnized_row(self.first.keys, sized)
      table << '-' * table.first.length
      self.each { |row| table << qa_columnized_row(row.values, sized) }
      table.join("\n   ") # Spaces added to work with format_log_entry
    end
  end

  module Watcher
    def explain
      raise(ArgumentError, "No block given") if !block_given?
      begin
        ActiveRecord::ConnectionAdapters::MysqlAdapter.send(:alias_method, :select_without_explain, :select)
        ActiveRecord::ConnectionAdapters::MysqlAdapter.send(:alias_method, :select, :select_with_explain)
        result = yield
      ensure
        ActiveRecord::ConnectionAdapters::MysqlAdapter.send(:alias_method, :select_with_explain, :select)
        ActiveRecord::ConnectionAdapters::MysqlAdapter.send(:alias_method, :select, :select_without_explain)
      end

      result
    end
  end

  module MysqlAdapterExt
    private

    def select_with_explain(sql, name = nil)
      query_results = select_without_explain(sql, name)

      if sql =~ /^select/i
        output = ActiveRecord::Base.silence do  
          explain_results = select_without_explain("explain #{sql}", name)
          format_log_entry("\033[1;34m#{sql} \033[0m\n", "#{explain_results.qa_columnized}\n")
        end
        puts output
      end

      query_results
    end
  end
end
