
namespace :ffcrm do
  namespace :comment_replies do
    desc "Run comment inbox crawler and process incoming emails"
    task run: :environment do
      require "statia_gov/mail_processor/comment_replies"
      StatiaGov::MailProcessor::CommentReplies.new.run(dry_run = false)
    end
    namespace :run do
      desc "[Dry run] - Run comment inbox crawler and process incoming emails"
      task dry: :environment do
        require "statia_gov/mail_processor/comment_replies"
        StatiaGov::MailProcessor::CommentReplies.new.run(dry_run = true)
      end
    end

    desc "Set up comment inbox based on currently loaded settings"
    task setup: :environment do
      require "statia_gov/mail_processor/comment_replies"
      StatiaGov::MailProcessor::CommentReplies.new.setup
    end
  end
end
