require 'pry'

def all_contestants
  contestant_array=[]
  data.each do |season_title, season_deets|
    season_deets.each do |season_deet|
      contestant_array << season_deet
   end
  end
  return contestant_array
end

def get_first_name_of_season_winner(data, season)
 winner_name = ""
  season_info = data.each do |season_title, season_deets|
  if season_title == season
    season_deets.find do |contestant_data|
      contestant_data["status"]== "Winner"
      winner_name=contestant_data["name"]
    end
  end

end
return winner_name.split[0]
end

def get_contestant_name(data, occupation)
  data.each do |season_title, season_deets|
    season_deets.each do |season_deet|
     if  season_deet["occupation"] == occupation
      return season_deet["name"]
     end
    end
  end
end

# def count_contestants_by_hometown(data, hometown)
#   counter = 0
#   data.each do |season_title, season_deets|
#     season_deets.each do |season_deet|
#      if  season_deet["hometown"] == hometown
#       counter +=1
#      end
#     end
#   end
#   return counter
# end

#woohooo, shortening slightly with the helper method!
def count_contestants_by_hometown(data, hometown)
counter = 0
all_contestants.each do |contestant|
  if contestant["hometown"] == hometown
    counter+=1
 end
 end
 return counter
end

def get_occupation(data, hometown)
  selected_contestant = all_contestants.find do |contestant|
    contestant["hometown"] == hometown
  end
selected_contestant["occupation"]
end

def get_average_age_for_season(data, season)
numerator=0
denominator=0
  data.each do |season_title, season_deets|
    if season_title == season
      numerator = season_deets.reduce(0) do |sum, contestant_data|
        sum+= contestant_data["age"].to_f
      end
      denominator= season_deets.length
    end
  end
  average=(numerator/denominator).round()
end

