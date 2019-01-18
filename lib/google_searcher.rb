require 'watir'
require 'launchy'

def check_if_user_gave_input
  abort("you need to put in argument your research") if ARGV.empty?
end

def get_research
  return  ARGV
end

def make_research
	#browser = Watir::Browser.new(:firefox)
	Launchy.open('google.com/search?q=' + get_research.join("+"))
end

def perform
	check_if_user_gave_input
	make_research
end

perform

=begin
def create_folder(name)
  Dir.mkdir(name)
end

=end
