
namespace :ffcrm do
  namespace :dropbox do
    desc "Run dropbox crawler and process incoming emails"
    task run: :environment do
      require "statia_gov/mail_processor/dropbox"
      StatiaGov::MailProcessor::Dropbox.new.run(dry_run = false)
    end

    namespace :run do
      desc "[Dry run] - Run dropbox crawler and process incoming emails"
      task dry: :environment do
        require "statia_gov/mail_processor/dropbox"
        StatiaGov::MailProcessor::Dropbox.new.run(dry_run = true)
      end
    end

    desc "Set up email dropbox based on currently loaded settings"
    task setup: :environment do
      require "statia_gov/mail_processor/dropbox"
      StatiaGov::MailProcessor::Dropbox.new.setup
    end
  end
end
