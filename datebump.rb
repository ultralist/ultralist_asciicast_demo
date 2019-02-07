require "json"
require "date"

todos = JSON.parse(File.read(".todos.json"))

todos.each do |todo|
  next if todo["due"] == ""

  due = Date.parse(todo["due"])
  todo["due"] = Date.parse(todo["due"]) + 1
end

f = File.open(".todos.json","w")
f << todos.to_json
f.close
