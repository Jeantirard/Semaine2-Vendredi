def check_if_user_gave_input
  abort("Vous devez entrez le nom du fichier \n Ce nom dois être en un seul mot") if (ARGV.empty? || ARGV.size >1)
end

def get_argument
  return ARGV.join
end


def create_folder(name)
  Dir.mkdir(name)
end

def perform
	check_if_user_gave_input
	dir_name = get_argument
	create_folder(dir_name)
	Dir.chdir("#{dir_name}")
	system("touch Gemfile")
	system("echo \"	source \"https://rubygems.org\" \n 
		ruby \'2.5.1\' \n
		gem \'rubocop\', \'~> 0.57.2\' \n
		gem \'rspec\' \n
		gem \'pry\' \n
		gem \'dotenv\' \n
		gem \'nokogiri\' \n
		gem \'watir\' \n
		gem \'launchy\' \" >> Gemfile")

	system("git init")
	system("touch .env")
	system("touch .gitignore")
	system("echo \".env\" >> .gitignore")
	system("mkdir lib")
	system("rspec --init")
	system("touch Readme.md")
	system("echo \"Programme Ruby créé par Thomas FERAL\" >> Readme.md")
	Dir.chdir("lib")
	system("touch app.rb")
	system("echo \"require \'rubocop\'\nrequire \'rspec\'\nrequire \'pry\'\nrequire \'dotenv\'\nrequire \'nokogiri\'\nrequire \'watir\'\nrequire \'launchy\'\" >> app.rb")
	Dir.chdir("../spec")
	system("touch app_spec.rb")
	system("echo \"require_relative \'../lib/app.rb\'\ndescribe \"\" do\n  it \"\" do\n    expect(function(arguments)).to eq(result)\n  end\nend\" >> app_spec.rb")


end


perform