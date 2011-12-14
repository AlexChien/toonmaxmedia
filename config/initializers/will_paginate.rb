# encoding: utf-8 
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '&laquo; 上页'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '下页 &raquo;'

# config/initializers/will_paginate.rb
if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        alias_method :per, :per_page
        alias_method :num_pages, :total_pages
        alias_method :total_count, :total_pages
      end
    end
  end
end