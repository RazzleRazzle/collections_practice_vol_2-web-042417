require 'pry'

#takes array and return true of all elem start with 'r' // return false
def begins_with_r(array)
  array.all? { |word| word.start_with?('r')}
end

#returns elements that contain 'a'
def contain_a(array)
  array.select { |element| element.include?('a') }
end

#return the first element that begins with letters 'wa'
def first_wa(array)
  array.find { |word| word.to_s.start_with? ('wa') }
end

#removes any non-string elements
def remove_non_strings(array)
  array.delete_if { |element| element.class != String}
end

#count how many times element appears in array
def count_elements(array)
  counted = array.uniq
  array.each do |hash|
    hash[:count] = 0
    current_name = hash[:name]
      array.each do |element|
        if element[:name] == current_name
          hash[:count] += 1
      end
    end
  end
  counted
end

#combines two structures
def merge_data(keys, data)
  merged_array = []
  keys.each do |name| #keys {name = name} {data: name{attribute}}
    curr_name = name[:first_name]
    data.each do |key|
      key.each do |k, v|
        if k == curr_name
            v[:first_name] = k[curr_name]
            merged_array << v
        end
      end
    end
  end
  merged_array
end

#finds all cool hashes
def find_cool(array)
  cool = []
  array.each do |hash|
    if hash[:temperature] == "cool"
      cool << hash
    end
  end
  cool
end

#organizes by location
def organize_schools(array)
  organized = {}
  array.each do |school, info| #key is school, value is {location:city}
    school_city = info[:location]
      if organized[school_city]
        organized[school_city] << school
      else
        organized[school_city] = []
        organized[school_city] << school
    end
  end
  #binding.pry
  organized
end
