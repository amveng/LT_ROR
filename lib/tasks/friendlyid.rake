# frozen_string_literal: true

# for next deploy run - RAILS_ENV=production rake friendly_id:content
namespace :friendly_id do
  desc 'task for adding friendyid to an existing database'
  task content: :environment do
    Content.find_each(&:save)
  end
end
