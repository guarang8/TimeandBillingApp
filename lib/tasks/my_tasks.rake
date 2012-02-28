task :user_check => :environment do
  
  users = User.all
  users.each do |u|
    puts u.email
  end
end

desc "Big scraper"
task :big_scraper => :environment do
  #scrape users to reset a setting
  #send an email
  #whatever
end
