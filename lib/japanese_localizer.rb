# DateHelperJp
module ActionView
  module Helpers
    module DateHelper
      
    end
    
    class DateTimeSelector #:nodoc:
      # Given an ordering of datetime components, create the selection html
      # and join them with their appropriate seperators
      def build_selects_from_types(order)
        select = ''
        order.each do |type|
          separator = separator(type)
          
          case type
            when :year, :month, :day
            select << send("select_#{type}").to_s
            select << separator.to_s
            select << '&nbsp;'
          else
            select << separator.to_s
            select << send("select_#{type}").to_s
          end
        end
        select
      end
      
      # Returns the separator for a given datetime component
      def separator(type)
        case type
          when :year
          @options[:year_separator] || ''
          
          when :month
          @options[:month_separator] || ''
          
          when :day
          @options[:day_separator] || ''
          
          when :hour
           (@options[:discard_year] && @options[:discard_day]) ? "" : @options[:datetime_separator]
          
          when :minute
          @options[:time_separator]
          
          when :second
          @options[:include_seconds] ? @options[:time_separator] : ""
          
        end
      end
    end
  end
end