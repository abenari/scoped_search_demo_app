# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
"Bill Kristol - Weekly Standard
Tom Hanks - Larry Crowne
Louis C.K. - Louie
Jennifer Aniston - Horrible Bosses
Bruce Headlam - Page One: Inside the New York Times
Mitchell Zuckoff - Lost in Shangri-La: A True Story of Survival, Adventure, and the Most Incredible Rescue Mission of World War II.
Cameron Diaz - Bad Teacher
Ray Nagin - Katrina's Secrets: Storms After The Storm
No Show
Trey Parker & Matt Stone - The Book of Mormon Musical
J.J. Abrams - Super 8
Alex Prud'Homme - The Ripple Effect: The Fate of Fresh Water in the Twenty-First Century
Howard Wasdin - SEAL Team Six: Memoirs of an Elite Navy SEAL Sniper
Larry King - Truth Be Told: Off the Record about Favorite Guests, Memorable Moments, Funniest Jokes, and a Half Century of Asking Questions
Fareed Zakaria - The Post-American World (Release 2.0)
Maziar Bahari - Then They Came for Me: A Family's Story of Love, Captivity, and Survival
No Show
Tim Tebow - Through My Eyes
Bill Moyers - Bill Moyers Journal: The Conversation Continues
Jimmy Fallon - Thank You Notes".split("\n").each do |line|
  name, book = line.split("-").map!(&:strip)
  author = Author.create :first_name => name.split[0], :last_name => name.split[1]
  Book.create :name => book, :author_id => author.id
end
