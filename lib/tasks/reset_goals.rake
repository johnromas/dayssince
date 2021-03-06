task reset_goals: :environment do
	day = Date.today - 2
  User.all.each do |user|
  	goals = user.goals.select { |goal| goal.current_record.updated_at <= day }
  	goals.each { |goal| goal.reset }
  end
end