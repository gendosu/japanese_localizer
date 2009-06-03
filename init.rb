# Include hook code here
raise "This version of DateHelperJp requires Rails 2.2.x or higher.  Please use an earlier version." unless Rails::VERSION::MAJOR == 2 && Rails::VERSION::MINOR >= 2

require File.dirname(__FILE__) + '/lib/date'
require File.dirname(__FILE__) + '/lib/datetime'
require File.dirname(__FILE__) + '/lib/time'
require File.dirname(__FILE__) + '/lib/time_with_zone'
require File.dirname(__FILE__) + '/lib/japanese_localizer'

I18n.default_locale = :jp
I18n.locale = :jp
I18n.load_path.concat(Dir[File.join(File.dirname(__FILE__), 'locale', '*.{rb,yml}')])
I18n.load_path.concat(Dir[File.join(RAILS_ROOT, 'config', 'locale', '*.{rb,yml}')])
