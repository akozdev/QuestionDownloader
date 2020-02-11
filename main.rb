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



# {
#   "detail": "Invalid page."
# }

# Dir.mkdir('./.data') unless File.directory?('./.data')
# File.write('./.data/response.json', response_hash.to_json)




# {
#   "_class": "question",
#   "id": "x01LQyh7JLQT83n2j4ogUXNxQ==",
#   "created": "2019-01-22T21:23:54Z",
#   "title": "Coding Challenge I",
#   "body": "<pre class=\"prettyprint linenums\">var markMass = 70;\nvar markHeight = 1.85;\nvar johnMass = 85;\nvar johnHeight = 1.96;\n\nvar markBMI = markMass/Math.pow(markHeight, 2);\nvar johnBMI = johnMass/Math.pow(johnHeight, 2);\n\nvar higherBMI = markBMI &gt; johnBMI;\nconsole.log('Is Mark\\'s BMI higher than John\\'s? ' + higherBMI);\nconsole.log('Mark\\'s BMI ' + markBMI.toFixed(2));\nconsole.log('John\\'s BMI ' + johnBMI.toFixed(2));</pre>",
#   "num_replies": 1,
#   "num_follows": 1,
#   "num_reply_upvotes": 1,
#   "modified": "2019-01-28T06:29:35Z",
#   "last_activity": "2019-01-23T17:25:17Z",
#   "is_read": true,
#   "course": {
#     "_class": "course",
#     "id": "x01JJLw2q9HPu7WenpbymTZ1w==",
#     "title": "The Complete JavaScript Course 2020: Build Real Projects!",
#     "url": "/course/the-complete-javascript-course/"
#   },
#   "is_instructor": false,
#   "num_upvotes": 0,
#   "next_reply": null,
#   "previous_reply": null,
#   "replies": [
#     {
#       "_class": "answer",
#       "id": "x01_nT_Lb4BZj9hyM-subm6Pg==",
#       "created": "2019-01-23T17:25:17Z",
#       "last_activity": "2019-01-23T17:25:17Z",
#       "user": {
#         "_class": "user",
#         "id": "x01Abh2OhBrL67XONV132hFMQ==",
#         "title": "Aleksander Kozłowski",
#         "name": "Aleksander"
#       },
#       "is_top_answer": null,
#       "body": "<p>Well done, Julius! Nice use of Math.pow() method</p>"
#     }
#   ]
# },