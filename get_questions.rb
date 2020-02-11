require './errors/pagination_error'

def get_questions(config)
	# Construct the url to Udemy Instructor API
  url = "https://www.udemy.com/instructor-api/v1/courses/#{config[:course_id]}/questions/?page=#{config[:page]}&page_size=#{config[:page_size]}"

  # Send http request and parse the response to hash
  response_hash = HTTParty.get(url, :headers => config[:headers]).parsed_response
  
  # Raise an error if the page does not exist
  raise PaginationError if response_hash["detail"] == "Invalid page."

  # Take only the results (questions)
  questions = response_hash["results"]
end