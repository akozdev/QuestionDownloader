require 'httparty'
require 'json'
require './get_questions'

API_TOKEN = ENV['API_TOKEN']
COURSE_ID = 'x01JJLw2q9HPu7WenpbymTZ1w=='
PAGE = 1
PAGE_SIZE = 100

# Request headers required by Udemy
headers = {
	"Accept": "application/json, text/plain, */*",
	"Authorization": "bearer #{API_TOKEN}",
	"Content-Type": "application/json;charset=utf-8"
}

config = {
	course_id: COURSE_ID,
	page: PAGE,
	page_size: PAGE_SIZE,
	headers: headers
}

get_questions(config)


# Dir.mkdir('./.data') unless File.directory?('./.data')
# File.write('./.data/response.json', response_hash.to_json)
