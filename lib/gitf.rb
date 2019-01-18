require "pry"
def check_if_user_gave_input
  abort("Vous devez donner le lien SSH") if (ARGV.empty? || ARGV.size >1)
end

def perform
	check_if_user_gave_input
	ssh = ARGV.join
	#binding.pry 
	system("git add . ")
	system ("git commit -am \"premier commit\" ")
	system("git remote add origin","#{ssh}")
	system("git push orign master")
end

perform
 