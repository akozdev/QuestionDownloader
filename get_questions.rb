def get_questions(config)
	# Construct the url to Udemy Instructor API
  url = "https://www.udemy.com/instructor-api/v1/courses/#{config[:course_id]}/questions/?page=#{config[:page]}&page_size=#{config[:page_size]}"

  # Send http request and parse the response to hash
	response_hash = HTTParty.get(url, :headers => config[:headers]).parsed_response

  # Take only the results (questions)
  questions = response_hash["results"]

  questions.each do |question|
    
  end

  # Dir.mkdir('./.data') unless File.directory?('./.data')
  # File.write('./.data/questions.json', questions.to_json)
end



# complete_question = {
#   _class: "question",
#   id: "",

# }





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