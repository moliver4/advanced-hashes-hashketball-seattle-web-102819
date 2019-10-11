def game_hash
  game_hash =
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {:name=> "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {:name=> "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {:name=> "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {:name=> "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      { :name=> "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
       {:name=> "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {:name=> "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {:name=> "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {:name=> "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
    ]
  }
}
end


#takes player's name and reutrns number of points scored by player
def num_points_scored(player_name)
  answer = nil
  game_hash.each do |location, teamdata| #home or away and their info hash
    teamdata[:players].each do |player|  # each entry is a hash for a player
      if player[:name]==player_name
        answer = player[:points]
      end
    end
  end
  answer
end


def shoe_size(name)
  answer = nil
  game_hash.each do |location, teamdata| #home or away and their info hash
    teamdata[:players].each do |player|  # each entry is a hash for a player
      if player[:name]==name
        answer = player[:shoe]
      end
    end
  end
  answer
end


def team_colors(team_name)
  answer = nil
  game_hash.each do |location, teamdata|
    if teamdata[:team_name] == team_name
      answer = teamdata[:colors]
    end
  end
  answer
end

def team_names
  names = []
  game_hash.each do |location, teamdata|
    names.push(teamdata[:team_name])
  end
  names
end

def player_numbers(team_name)
  numbers=[]
  game_hash.each do |location, teamdata|
    if teamdata[:team_name] == team_name
      teamdata[:players].each do |player|
        numbers.push(player[:number])
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |location, teamdata|
    teamdata[:players].each do |player|
      if player[:name] == player_name
        stats = player
      end
    end
  end
  stats.delete(:name)
  stats
end

def big_shoe_rebounds
  biggest_foot_rebounds = nil
  biggest_foot = 0
  game_hash.each do |location, teamdata|
    teamdata[:players].each do |player|
      if player[:shoe] > biggest_foot
        biggest_foot = player[:shoe]
      end
    end
    teamdata[:players].each do |player|
      if player[:shoe]== biggest_foot
        biggest_foot_rebounds = player[:rebounds]
      end
    end
  end
  biggest_foot_rebounds
end

def most_points_scored
  winner=nil
  most_points=0
  game_hash.each do |location, teamdata|
    teamdata[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
      end
    end
    teamdata[:players].each do |player|
      if player[:points] == most_points
        winner= player[:name]
      end
    end
  end
  winner
end

def winning_team
  away_points = 0
  home_points = 0
  winner = nil
  game_hash[:away][:players].each do |player|
    away_points += player[:points]
  end
  game_hash[:home][:players].each do |player|
    home_points += player[:points]
  end
  if away_points>home_points
    winner = game_hash[:away][:team_name]
  else
    winner = game_hash[:home][:team_name]

  end
  winner
end

def player_with_longest_name
  longest_name = 0
  player_name = nil
  game_hash.each do |location, teamdata|
    teamdata[:players].each do |player|
      if player[:name].length > longest_name
        longest_name = player[:name].length
      end
    end
    teamdata[:players].each do |player|
      if player[:name].length == longest_name
        player_name = player[:name]
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  longest_name_player = player_with_longest_name
  max_steals = 0
  game_hash.each do |location, teamdata|
    teamdata[:players].each do |player|
      if player[:steals] > max_steals
        max_steals = player[:steals]
      end
    end
    teamdata[:players].each do |player|
      if player[:name] == longest_name_player
        if player[:steals] == max_steals
          return true
        end
      end
    end
  end
  return false
end
