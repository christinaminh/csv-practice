require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  olympian_array_of_hashes = CSV.read(filename, headers:true).map do |olympian|
    olympian_hash = olympian.to_h
    olympian_hash.each do |header, attributes|
      olympian_hash.delete(header) if !REQUIRED_OLYMPIAN_FIELDS.include?(header)
    end
  end

  return olympian_array_of_hashes
end



def total_medals_per_team(olympic_data) # olympic_data is olympian_array_of_hashes

  olympic_data_only_winners = olympic_data.filter do |olympian|
      olympian["Medal"] != "NA"
  end

  team_to_medal = Hash.new(0)
  olympic_data_only_winners.each do |olympian|
    team = olympian["Team"]
    team_to_medal[team] += 1
  end

  return team_to_medal
end



def get_all_gold_medalists(olympic_data)
  gold_winners = olympic_data.filter do |olympian|
    olympian["Medal"] == "Gold"
  end

  return gold_winners
end

