# frozen_string_literal: true

require 'byebug'

def group_titles(strs)
  res = {}
  strs.each do |s|
    # an empty array to hold all has values
    count = [0] * 26
    s.each_char do |c|
      # find the index in the array of characters and add occurrences.
      index = c.ord - 'a'.ord
      count[index] += 1
    end

    key = count.to_a
    if res.include? key
      res[key].push(s)
    else
      res[key] = [s]
    end
  end

  res.values
end

# Driver code

titles = %w[duel dule speed spede deul cars]
gt = group_titles(titles)
query = 'spede'

# Searching for all titles
gt.each do |g|
  puts g if g.include? query
end
