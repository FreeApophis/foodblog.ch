# config/initializers/locale.rb
 
# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
 
# Whitelist locales available for the application
I18n.available_locales = [:en, :'en-us', :'en-gb', :de, :'de-ch', :'de-de', :'de-at', :'de-lu', :'de-li', :'de-it']
 
# Set default locale to something other than :en
I18n.default_locale = :'de-ch'

Rails.application.config.i18n.fallbacks = {
  'en-us' => 'en',
  'en-gb' => 'en',
  'de-de' => 'de',
  'de-ch' => 'de',
  'de-at' => 'de',
  'de-lu' => 'de',
  'de-li' => 'de',
  'de-it' => 'de',
}
