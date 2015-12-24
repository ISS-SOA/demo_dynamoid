require 'rake/testtask'
require 'config_env/rake_tasks'

task :config do
  ConfigEnv.path_to_config("#{__dir__}/config/config_env.rb")
end

desc "Echo to stdout an environment variable"
task :echo_env, [:var] => :config do |t, args|
  puts "#{args[:var]}: #{ENV[args[:var]]}"
end
# rake tasks with arguments:
#  http://stackoverflow.com/questions/825748/how-do-i-pass-command-line-arguments-to-a-rake-task

namespace :db do
  require_relative 'models/init.rb'
  require_relative 'config/init.rb'

  desc "Create tutorial table"
  task :article do
    begin
      Article.create_table
      puts 'Tutorial table created'
    rescue Aws::DynamoDB::Errors::ResourceInUseException => e
      puts 'Table already exists?'
    end
  end

  task :tag do
    begin
      Tag.create_table
      puts 'Article table created'
    rescue Aws::DynamoDB::Errors::ResourceInUseException => e
      puts 'Table already exists?'
    end
  end
end
