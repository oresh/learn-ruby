# parse json data and make a list of matching

require 'json'
file = File.read('test4.json')
data_hash = JSON.parse(file)

class Authors
  attr_accessor :items, :items_arr

  def initialize(items)
    self.items = items
    self.get_items
  end

  def get_items(items = self.items)
    items_arr = Array.new
    items.each do |item|
      items_arr.push({"name" => item['name'], "genre" => item['genre']})
    end
    self.items_arr = items_arr
  end

  def sort_items(order = 'asc', prop = "name")
    def sort_checker(a, b, type)
      if (type == 'asc')
        a <=> b
      else
        b <=> a
      end
    end
    self.get_items.sort {|a, b| sort_checker(a[prop], b[prop], order)}
  end

  def list_items(items = self.items)
    items.each do |item|
      puts "name: #{item['name']}, genre: #{item['genre']}"
    end
  end
end


list = Authors.new(data_hash["items"])
puts list.sort_items('desc', 'genre')