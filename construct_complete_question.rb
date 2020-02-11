def construct_complete_question(question, replies)
  complete_question = {
    _class: "question",
    id: question["id"],
    created: question["created"],
    title: question["title"],
    body: question["body"],
    num_replies: question["num_replies"],
    num_follows: question["num_follows"],
    num_reply_upvotes: question["num_reply_upvotes"],
    modified: question["modified"],
    last_activity: question["last_activity"],
    is_read: question["is_read"],
    course: {
      _class: "course",
      id: question["course"]["id"],
      title: question["course"]["title"],
      url: question["course"]["url"]
    },
    is_instructor: question["is_instructor"],
    num_upvotes: question["num_upvotes"],
    next_reply: question["next_reply"],
    previous_reply: question["previous_reply"],
    replies: replies
  }
end