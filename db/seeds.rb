user_array = 10.times.collect do User.create!(username: Faker::HarryPotter.character, password: "pass")
end

question_array = 20.times.collect do Question.create!( title: Faker::HarryPotter.location, body: Faker::HarryPotter.quote)
  end

answer_array = 20.times.collect do Answer.create!( body: Faker::HarryPotter.quote ) end


question_array.each do |question|
  question.author_id = user_array.sample.id
  question.save
end

answer_array.each do |answer|
  answer.solver_id = user_array.sample.id
  answer.question_id = question_array.sample.id
  answer.save
end

