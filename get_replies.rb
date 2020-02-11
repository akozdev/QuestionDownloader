require './errors/pagination_error'

def get_replies(config)
  # Store for all replies for a given question
  replies = []

  # Get all replies
  while true
    # Construct the url to Udemy Instructor API
    url = "https://www.udemy.com/instructor-api/v1/courses/#{config[:course_id]}/questions/#{config[:question_id]}/replies/?page=#{config[:page]}&page_size=#{config[:page_size]}"

    begin
        # Send http request and parse the response to hash
        response_hash = HTTParty.get(url, :headers => config[:headers]).parsed_response

        # Raise an error if the page does not exist
        raise PaginationError if response_hash["detail"] == "Invalid page."

        response_hash["results"].each do |result|
          replies.push(result)
        end

        # Increment page to fetch the next page from pagination
        config[:page] += 1

    rescue => exception
      # If the next page in pagination doesn't exist, return replies
      return replies
    end
  end
end