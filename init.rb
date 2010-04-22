# Include hook code here
raise "This version of DateHelperJp requires Rails 2.2.x or higher.  Please use an earlier version." unless Rails::VERSION::MAJOR == 2 && Rails::VERSION::MINOR >= 2

require File.dirname(__FILE__) + '/lib/date'
require File.dirname(__FILE__) + '/lib/datetime'
require File.dirname(__FILE__) + '/lib/time'
require File.dirname(__FILE__) + '/lib/time_with_zone'
require File.dirname(__FILE__) + '/lib/japanese_localizer'

I18n.default_locale = :jp
I18n.locale = :jp

plugin_locale  = Dir[File.join(File.dirname(__FILE__), 'locale', '*.{rb,yml}')]
project_locale = Dir[File.join(RAILS_ROOT, 'config', 'locale', '*.{rb,yml}')]

if Rails::VERSION::MAJOR == 2 && Rails::VERSION::MINOR == 3 && Rails::VERSION::TINY >= 5
  I18n.load_path.insert(I18n.load_path.count - project_locale.count, plugin_locale)
else
  I18n.load_path.concat(plugin_locale)
  I18n.load_path.concat(project_locale)
end

