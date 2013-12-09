require "data_mapper"
require_relative "user"

DataMapper.setup(:default, "sqlite::memory")
DataMapper.auto_upgrade!
