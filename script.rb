require 'httparty'
require 'json'

api_token = ENV['API_TOKEN']
course_id = 'x01JJLw2q9HPu7WenpbymTZ1w=='
page = 1
page_size = 100

# Request headers required by Udemy
headers = {
	"Accept": "application/json, text/plain, */*",
	"Authorization": "bearer #{API_TOKEN}",
	"Content-Type": "application/json;charset=utf-8"
}


Dir.mkdir('./.data') unless File.directory?('./.data')
File.write('./.data/response.json', response_hash.to_json)





def get_questions(course_id, page, page_size)
	# Construct the url to Udemy Instructor API
	url = "https://www.udemy.com/instructor-api/v1/courses/#{course_id}/questions/?page=#{page}&page_size=#{page_size}"

	# Send http request and parse the response to hash
	response_hash = HTTParty.get(url, :headers => headers).parsed_response

	
end