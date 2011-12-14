I18n.load_path += Dir[Rails.root.join('config', 'locale', '*.{rb,yml}')]

# set default locale to something other than :en
I18n.default_locale = "zh-CN"
