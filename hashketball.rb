require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {"Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }},
        {"Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }},
        {"Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }},
        {"Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }},
        {"Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {"Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }},
        {"Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }},
        {"DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }},
        {"Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }},
        {"Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }}
      ]
    }
  }
end



def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |key,value|
      if key == :players
        value.each do |player|
        player.each do |player_name, player_stats|
        if name == player_name
          return player_stats[:points]
    end
    end
    end
    end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |key,value|
      if key == :players
        value.each do |player|
        player.each do |player_name, player_stats|
        if name == player_name
          return player_stats[:shoe]
    end
    end
    end
    end
    end
  end
end

def team_colors(team_name)
  hash = game_hash
  array = []
  hash.each do |location, attributes|
    if hash[location].values.include?(team_name)
      attributes.each do |attribute, info|
        if attribute == :colors
          return info
        end
      end
    end
  end
end

def team_names
  game_hash.collect do |team, team_details_hash|
    team_details_hash[:team_name]
  end
end

def player_numbers(team)
  array2 = []
  game_hash.each do |location, team_data|
    if :team_data = team
      team_data.each do |attribute, values|
          if attribute == :players
            values.each do |person|
              person.each do |player_name,player_number|
              player_number.each do |i, j|

                if i == :number
                  array2.push(j)
                end
                end
                end
              end
            end
          end
      end
  end
  return array2
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |key,value|
      if key == :players
        value.each do |player|
        player.each do |player_name, player_stats|
        if name == player_name
          return player_stats
        end
      end
    end
  end
end
end
end



def big_shoe_rebounds
  hash = game_hash[:home][:players][3]
  hash["Mason Plumlee"][:rebounds]
end

def most_points_scored
most_points = 0
 game_hash.each do |location, team_data|
   team_data[:players].each do |player|
     player.each do |key,value|
     points = player[:points]
     if points > most_points
       most_points = points
       mvp = player[key]
     end
     end
   end
 end
 mvp
end






def winning_team
  total_points = 0
  win_team = ''
  game_hash.each do |location, team_data|
    team_points = 0
    team_name = game_hash[location][:team_name]
    team_data[:players].each do |player|
      points = player[:points]
      team_points += points
    end
    win_team, total_points = team_name, team_points if team_points > total_points
  end
  return win_team
end


def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:player_name].length
      longest, longest_length = player[:player_name], name_length if name_length > longest_length
    end
  end
  return longest
end



def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
    end
  end
  return true if steals_most == player_with_longest_name
end
