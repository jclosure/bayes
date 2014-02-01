require 'rubygems'
require 'stemmer'
require 'classifier'
require 'yaml'

# Load previous classifications
funny       = YAML::load_file('funny.yml')
not_funny = YAML::load_file('not_funny.yml')

# Create our Bayes / LSI classifier
classifier = Classifier::Bayes.new('Funny', 'Not Funny')

# Train the classifier
not_funny.each { |boo| classifier.train_not_funny boo }
funny.each { |good_one| classifier.train_funny good_one }

# Let's classify some new quotes
puts classifier.classify "Peter: A boat's a boat but a box could be anything! It could even be a boat!"
puts classifier.classify "Stewie: Damn you ice cream, come to my mouth! How dare you disobey me!"
puts classifier.classify "Brian: I could take my sweater off too, but I think it's attached to my skin. "
puts classifier.classify "Peter: Hey, anybody got a quarter? Bill Gates: What's a quarter? "
puts classifier.classify "Peter: I had such a crush on her. Until I met you Lois. You're my silver medal. "
puts classifier.classify "Meg: Excuse me, Mayor West? Adam West: How do you know my language? "
puts classifier.classify "Meg: You could kill all the girls who are prettier than me. Death: Well, that would just leave England. "

# Print the classifier itself
p classifier