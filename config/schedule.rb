# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron


#whenever(開発環境)
# require File.expand_path(File.dirname(__FILE__) + "/environment")
# set :environment, Rails.env.to_sym
# set :output, "#{Rails.root}/log/cron.log"
# set :job_template, "/bin/zsh -l -c ':job'"
# job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"
#whenever(本番環境)
set :environment, :production
set :output, "log/cron.log"

every 1.month, at: 'start of the month at 0am' do
  rake "fixed_update:monthly"
end



# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
