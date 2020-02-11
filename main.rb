# Dependencies
require 'httparty'
require 'json'

# Modules
require './get_questions'
require './get_replies'
require './construct_complete_question'

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

config_questions = {
	course_id: COURSE_ID,
	page: PAGE,
	page_size: PAGE_SIZE,
	headers: headers
}

config_replies = {
	course_id: COURSE_ID,
	question_id: "",
	page: 1,
	page_size: 100,
	headers: headers
}

# Complete question is the question and all replies
def gather_complete_questions(config_questions, config_replies)
	begin
		# Store complete questions
		complete_questions = []

		while true
			questions = get_questions(config_questions)

			questions.each do |question|
				config_replies[:question_id] = question["id"]

				replies = get_replies(config_replies)

				p replies
	
				# Consturct complete question
				complete_question = construct_complete_question(question, replies)
				
				complete_questions.push(complete_question)

				Dir.mkdir('./.data') unless File.directory?('./.data')
				File.write('./.data/response.json', complete_questions.to_json)
			end

			# Increment page to get the next page in pagination
			config_questions[:page] += 1
		end
	rescue => exception
		puts "No more questions to download..."
		return
	end
end

gather_complete_questions(config_questions, config_replies)
