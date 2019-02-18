require 'launchy'
require 'clipboard'
require 'securerandom'


#puts "Welcome to your personal login keeper."
#sleep 3 #waits 4 seconds before printing next line
#puts "It will generate a unique and strong password for your accounts."
#sleep 3
#puts "Then save all of your login information for you"
#sleep 4 #waits 4 seconds before printing next line
#puts "We currently support Google, Facebook, Instagram, and Reddit"
#sleep 4 #waits 4 seconds before printing next line

loop do #makes the entire program re run after a process has been complete

puts "Would you like to search for login information or add/change a login? (type search or add/change)"
search_or_new = gets.chomp
search_or_new.downcase

#beginning of search feature.
if search_or_new == "search"
  puts "Whitch website? (Google, Facebook, Instagram, or Reddit)"
  search_website_name = gets.chomp
  search_website_name.downcase

    if search_website_name == "google"
      puts File.read('pass_keeper_google.txt')
      puts "Copy password to clipboard? (y/n)"
      c2c_google = gets.chomp
      c2c_google.downcase
      if c2c_google == "y"
        google_copy_pass = File.read("pass_keeper_google_pass.txt") #sets text from password file to variable google_copy_pass
        Clipboard.copy(google_copy_pass) #copies text from password file to clipboard
      else
        puts "okay"
      end

    elsif search_website_name == "facebook"
      puts File.read('pass_keeper_facebook.txt')
      puts "Copy password to clipboard? (y/n)"
      c2c_facebook = gets.chomp
      c2c_facebook.downcase
      if c2c_facebook == "y"
        facebook_copy_pass = File.read("pass_keeper_facebook_pass.txt") #sets text from password file to variable google_copy_pass
        Clipboard.copy(facebook_copy_pass) #copies text from password file to clipboard
      else
        puts "okay"
      end

    elsif search_website_name == "instagram"
      puts File.read('pass_keeper_instagram.txt')
      puts "Copy password to clipboard? (y/n)"
      c2c_instagram = gets.chomp
      c2c_instagram.downcase
      if c2c_instagram == "y"
        instagram_copy_pass = File.read("pass_keeper_instagram_pass.txt") #sets text from password file to variable google_copy_pass
        Clipboard.copy(instagram_copy_pass) #copies text from password file to clipboard
      else
        puts "okay"
      end

    elsif search_website_name == "reddit"
      puts File.read('pass_keeper_reddit.txt')
      puts "Copy password to clipboard? (y/n)"
      c2c_reddit = gets.chomp
      c2c_reddit.downcase
      if c2c_reddit == "y"
        reddit_copy_pass = File.read("pass_keeper_reddit_pass.txt") #sets text from password file to variable google_copy_pass
        Clipboard.copy(reddit_copy_pass) #copies text from password file to clipboard
      else
        puts "okay"
      end

    else
      puts "That website is not supported yet"
    end
#end of search feature


elsif search_or_new == "add/change"
  puts "Which website? Facebook, Google, Instagram, and Reddit are the only sites currently supported" #get's website info from user [ 3 lines
  website = gets.chomp
  website.downcase #]

  if website == "google"

    a = ["!","@","#","$","%","^","&","*"].sample(12) #this block of code generates a random secure password [ 7 lines
    b = [*('a'..'z')].sample(12)
    c = [*('0'..'9')].sample(12)
    d = [*('A'..'Z')].sample(12)
    e = (a) + (b) + (c) + (d)
    f = e.sample(12)
    google_password = f.join # ]

    puts "What is the url?"
    google_url = gets.chomp
    puts "What is the Username?"
    google_username = gets.chomp

    class Google
      attr_accessor :url, :username, :password #sets parameters

      def initialize(url, un, pwd)
        @url = url
        @username = un
        @password = pwd
      end
      def show_info #gathers all login information to either print or save to file.
        "URL: #{url} Username: #{username} Password: #{password}"
      end
      def change_info(url, un, pwd) #used to change login information when feature is added in the future
        @url = url
        @username = un
        @password = pwd
      end
    end
    google_login = Google.new(google_url , google_username , google_password) #saves all login information to variable
    puts google_login.show_info
    Clipboard.copy(google_password)

    configFile = File.open("pass_keeper_google_pass.txt", "w") #creates a new file containing only password
    configFile.write("#{google_password}")
    configFile.write "\n"
    configFile.close


    configFile = File.open("pass_keeper_google.txt", "w") #opens file. "a" adds to file without deleting anything 'w' rewrites file
    configFile.write("#{google_login.show_info}")
    configFile.write "\n"
    configFile.close #closes the file
    puts "file saved" #shows success
    puts "Your password has been copied to the clipboard"
    puts "Would you like to go to login? (y/n)"
    google_login_response = gets.chomp
    google_login_response.downcase
    if google_login_response == "y"
      Launchy.open(google_url)
    else
      puts "Okay"
    end

  elsif website == "facebook"
    a = ["!","@","#","$","%","^","&","*"].sample(12)
    b = [*('a'..'z')].sample(12)
    c = [*('0'..'9')].sample(12)
    d = [*('A'..'Z')].sample(12)
    e = (a) + (b) + (c) + (d)
    f = e.sample(12)
    facebook_password = f.join

    puts "What is the url?"
    facebook_url = gets.chomp
    puts "What is the Username?"
    facebook_username = gets.chomp

    class Facebook
      attr_accessor :url, :username, :password

      def initialize(url, un, pwd)
        @url = url
        @username = un
        @password = pwd
      end
      def show_info
        "URL: #{url} Username: #{username} Password: #{password}"
      end
      def change_info(url, un, pwd)
        @url = url
        @username = un
        @password = pwd
      end
    end
    facebook_login = Facebook.new(facebook_url , facebook_username , facebook_password)
    puts facebook_login.show_info
    Clipboard.copy(facebook_password)

    configFile = File.open("pass_keeper_facebook_pass.txt", "w") #creates a new file containing only password
    configFile.write("#{facebook_password}")
    configFile.write "\n"
    configFile.close

    configFile = File.open("pass_keeper_facebook.txt", "w") #opens file. "a" adds to file without deleting anything 'w' rewrites file
    configFile.write("#{facebook_login.show_info}")
    configFile.write "\n"
    configFile.close #closes the file
    puts "file saved"
    puts "Your password has been copied to the clipboard"
    puts "Would you like to go to login? (y/n)"
    facebook_login_response = gets.chomp
    facebook_login_response.downcase
    if facebook_login_response == "y"
      Launchy.open(facebook_url)
    else
      puts "Okay"
    end
  elsif website == "instagram"
    a = ["!","@","#","$","%","^","&","*"].sample(12)
    b = [*('a'..'z')].sample(12)
    c = [*('0'..'9')].sample(12)
    d = [*('A'..'Z')].sample(12)
    e = (a) + (b) + (c) + (d)
    f = e.sample(12)
    instagram_password = f.join

    puts "What is the url?"
    instagram_url = gets.chomp
    puts "What is the Username?"
    instagram_username = gets.chomp

    class Instagram
      attr_accessor :url, :username, :password

      def initialize(url, un, pwd)
        @url = url
        @username = un
        @password = pwd
      end
      def show_info
        "URL: #{url} Username: #{username} Password: #{password}"
      end
      def change_info(url, un, pwd)
        @url = url
        @username = un
        @password = pwd
      end
    end
    instagram_login = Instagram.new(instagram_url , instagram_username , instagram_password)
    puts instagram_login.show_info
    Clipboard.copy(instagram_password)

    configFile = File.open("pass_keeper_instagram_pass.txt", "w") #creates a new file containing only password
    configFile.write("#{instagram_password}")
    configFile.write "\n"
    configFile.close

    configFile = File.open("pass_keeper_instagram.txt", "w") #opens file. "a" adds to file without deleting anything 'w' rewrites file
    configFile.write("#{instagram_login.show_info}")
    configFile.write "\n"
    configFile.close #closes the file
    puts "file saved"
    puts "Your password has been copied to the clipboard"
    puts "Would you like to go to login? (y/n)"
    instagram_login_response = gets.chomp
    instagram_login_response.downcase
    if instagram_login_response == "y"
      Launchy.open(instagram_url)
    else
      puts "Okay"
    end
  elsif website == "reddit"
    a = ["!","@","#","$","%","^","&","*"].sample(12)
    b = [*('a'..'z')].sample(12)
    c = [*('0'..'9')].sample(12)
    d = [*('A'..'Z')].sample(12)
    e = (a) + (b) + (c) + (d)
    f = e.sample(12)
    reddit_password = f.join

    puts "What is the url?"
    reddit_url = gets.chomp
    puts "What is the Username?"
    reddit_username = gets.chomp

    class Reddit
      attr_accessor :url, :username, :password

      def initialize(url, un, pwd)
        @url = url
        @username = un
        @password = pwd
      end
      def show_info
        "URL: #{url} Username: #{username} Password: #{password}"
      end
      def change_info(url, un, pwd)
        @url = url
        @username = un
        @password = pwd
      end
    end
    reddit_login = Reddit.new(reddit_url , reddit_username , reddit_password)
    puts reddit_login.show_info
    Clipboard.copy(reddit_password)

    configFile = File.open("pass_keeper_reddit_pass.txt", "w") #creates a new file containing only password
    configFile.write("#{reddit_password}")
    configFile.write "\n"
    configFile.close

    configFile = File.open("pass_keeper_reddit.txt", "w") #opens file. "a" adds to file without deleting anything 'w' rewrites file
    configFile.write("#{reddit_login.show_info}")
    configFile.write "\n"
    configFile.close #closes the file
    puts "file saved"
    puts "Your password has been copied to the clipboard"
    puts "Would you like to go to login? (y/n)"
    reddit_login_response = gets.chomp
    reddit_login_response.downcase
    if reddit_login_response == "y"
      Launchy.open(reddit_url)
    else
      puts "Okay"
    end
  else puts "We do not support that site yet"
  end
end
end
