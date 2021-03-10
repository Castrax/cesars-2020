require 'json'
require 'open-uri'

puts "Cleaning the DB..."
Category.destroy_all
Nominee.destroy_all
Answer.destroy_all
User.destroy_all
puts "DB cleaned."


puts 'Creating categories...'
def create_categories(filepath)
  data = data_parse(filepath)
  data['categories'].map { |category| Category.find_or_create_by!(title: category['title'], points: category['points']) }
end
puts 'Categories created'

puts 'Creating nominees...'
def create_nominees(filepath)
  data = data_parse(filepath)
  data['nominees'].map { |nominee| Nominee.find_or_create_by!(title_text: nominee_text_parse(nominee['title_type'], nominee['api_id_title']), subtitle_text: nominee_text_parse(nominee['subtitle_type'], nominee['api_id_subtitle']), category_id: nominee['category_id'], title_photo: images_parse(nominee['title_type'], nominee['api_id_title']), subtitle_photo: images_parse(nominee['subtitle_type'], nominee['api_id_subtitle']))}
end
puts 'Nominees created'

def data_parse(filepath)
  JSON.parse(File.read(filepath))
end

def images_parse(type, id)
  data_url = "https://api.themoviedb.org/3/#{type}/#{id}/images?api_key=29a362d339e7c52809de913c6163096a"
  configuration_url = "https://api.themoviedb.org/3/configuration?api_key=29a362d339e7c52809de913c6163096a"
  data_read = open(data_url).read
  config_read = open(configuration_url).read
  data_parsed = JSON.parse(data_read)
  config_parsed = JSON.parse(config_read)
  type == 'person' ? "#{config_parsed["images"]["base_url"]}#{config_parsed["images"]["profile_sizes"].last}#{data_parsed["profiles"][0]["file_path"]}" : "#{config_parsed["images"]["base_url"]}#{config_parsed["images"]["poster_sizes"].last}#{data_parsed["posters"][0]["file_path"]}"
end

def nominee_text_parse(type, id)
  data_url = "https://api.themoviedb.org/3/#{type}/#{id}?api_key=29a362d339e7c52809de913c6163096a&language=fr-FR"
  nominee_serialized = open(data_url).read
  nominee_parsed = JSON.parse(nominee_serialized)
  type == 'person' ? nominee_parsed["name"] : nominee_parsed["original_title"]
end

create_categories('db/seeds/categories.json')
create_nominees('db/seeds/nominees.json')

