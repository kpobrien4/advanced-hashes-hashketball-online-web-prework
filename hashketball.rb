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
          :steals => 7,
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



def player_numbers (name)
  player_numbers_list = []
  game_hash.each do |team, team_details_hash|
    if team_details_hash[:team_name] == name
      team_details_hash[:players].each do |player|
        player.each do |key, value|
          if key == :number
            player_numbers_list << value
          end
        end
      end
    end
  end
  return player_numbers_list
end
