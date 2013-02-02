MongoMapper.connection = Mongo::Connection.new('localhost',27017)
MongoMapper.database = "#mongotest-#{Rails.env}"

if defined?(PhusionPassenger)
	PhusionPassenge.on_event(:starting_worker_process) do |forked|
		MongoMapper.connection.connect if forked
	end
end