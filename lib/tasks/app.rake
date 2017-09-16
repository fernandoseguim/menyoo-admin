namespace :app do
  desc "TODO"
  task setup_database: :environment do
    Rake::Task['db:migrate'].invoke
    sql = File.open("#{Rails.root}/db/manual_migration.sql")
    ActiveRecord::Base.connection.execute(sql.read)
    Rake::Task['db:seed'].invoke
  end

end
