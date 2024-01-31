namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db/seeds/*.rb').to_s].each do |filename|
      task_name = File.basename(filename, '.rb').intern
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end
