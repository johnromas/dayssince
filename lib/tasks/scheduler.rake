desc "This task will reset goals that haven't been updated in 2 days"
task :reset_goals => :environment do
  User.all.each do |user|
		date = Time.now.in_time_zone(user.time_zone)
		goals = user.goals.select { |goal| goal.current_record.updated_at <= date }
		goals.each { |goal| goal.reset }
	end
end