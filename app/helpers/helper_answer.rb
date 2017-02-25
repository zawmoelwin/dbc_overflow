def find_user(id)

  User.find( id )
end

def vote_total(vote_array)
   vote_array.reduce(0) {|sum, vote| sum+ vote.value}
end

def vote_add (vote_array , value)
      vote_array << Vote.create(value: value, voter_id: current_user.id)
end

def sort_by_vote(votable_array)
  temp_votable = {}
  votable_array.each do |votable|
    temp_votable[votable.id] = vote_total(votable.votes)
  end
  a = temp_votable.sort_by{|k,v| v}.reverse

  return a
end

# h.sort {|x,y| -(x[1]<=>y[1])} -- 16.7s
# h.sort {|x,y| y[1] <=> x[1]} -- 12.3s
# h.sort_by {|k,v| -v} -- 5.9s
# h.sort_by {|k,v| v}.reverse -- 3.7
