# at the top of file

require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

puts (MESSAGES["sp"]["welcome"])
