require("rspec")
require("expense")
require("category")
require("pg")
require('pry')

DB = PG.connect({:dbname => 'charges_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
  end
end
