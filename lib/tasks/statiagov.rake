task :stats => "statiagov:stats"

namespace :statiagov do
  task :stats do
    require 'rails/code_statistics'
    ::STATS_DIRECTORIES << ["Services", "app/services"]
    ::STATS_DIRECTORIES << ["Forms", "app/forms"]
  end
end