
require 'pathname'

module StatiaGov
  module I18n
    #----------------------------------------------------------------------------
    def t(*args)
      if args.size == 1
        super(args.first, default: args.first.to_s)
      elsif args.second.is_a?(Hash)
        super(*args)
      elsif args.second.is_a?(Fixnum)
        super(args.first, count: args.second)
      else
        super(args.first, value: args.second)
      end
    end

    # Scan config/locales directory for Fat Free CRM localization files
    # (i.e. *_statia_gov.yml) and return locale part of the file name.
    # We can't use ::I18n.available_locales because rails provides it's own
    # translations too and we only want the locales that Fat Free CRM supports.
    #----------------------------------------------------------------------------
    def locales
      @@locales ||= ::I18n.load_path.grep(/_statia_gov\.yml$/).map { |path| Pathname.new(path).basename.to_s.match(/(.*)_statia_gov\.yml/)[1] }.uniq
    end

    # Return a hash where the key is locale name, and the value is language name
    # as defined in the locale_statia_gov.yml file.
    #----------------------------------------------------------------------------
    def languages
      @@languages ||= Hash[locales.map { |locale| [locale, t(:language, locale: locale)] }]
    end
  end
end

ActionView::Base.send(:include, StatiaGov::I18n)
ActionController::Base.send(:include, StatiaGov::I18n)
