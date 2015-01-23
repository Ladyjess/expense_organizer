require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/expenses")
require("pg")

DB = PG.connect({:dbname => "charges"})
