# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson", number: 0,  shoe: 16,  points: 22,  rebounds: 12,  assists: 12,  steals: 3,  blocks: 1,  slam_dunks: 1
        },
        {
          player_name: "Reggie Evans", number: 30,  shoe: 14,  points: 12,  rebounds: 12,  assists: 12,  steals: 12,  blocks: 12,  slam_dunks: 7
        },
        {
          player_name: "Brook Lopez", number: 11,  shoe: 17,  points: 17,  rebounds: 19,  assists: 10,  steals: 3,  blocks: 1,  slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee", number: 1,  shoe: 19,  points: 26,  rebounds: 11,  assists: 6,  steals: 3,  blocks: 8,  slam_dunks: 5
        },
        {
          player_name: "Jason Terry", number: 31,  shoe: 15,  points: 19,  rebounds: 2,  assists: 2,  steals: 4,  blocks: 11,  slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien", number: 4,  shoe: 18,  points: 10,  rebounds: 1,  assists: 1,  steals: 2,  blocks: 7,  slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",number: 0,  shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def home_team_players
  game_hash[:home][:players]
end
def away_team_players
  game_hash[:away][:players]
end

def array_of_player
  
  home_team_players + away_team_players
end
def num_points_scored playerName
    player = array_of_player.find { |player|  player[:player_name] == playerName }
  
    player[:points]
end

def shoe_size playerName
  player = array_of_player.find { |player|  player[:player_name] == playerName }
  player[:shoe]
end

def team_colors teamName
  findTeam =game_hash.find.with_index {|value, index| value[1][:team_name] == teamName}
  findTeam[1][:colors]
end

def team_names
  game_hash.map.with_index {|team| team[1][:team_name]}
end

def player_numbers teamName
  findTeamData =game_hash.find {|x| x[1][:team_name] == teamName}
  findTeamData[1][:players].map {|player| player[:number]}

end

def player_stats playerName
  array_of_player.find { |player|  player[:player_name] == playerName }
end

def big_shoe_rebounds 
  maxShoe= array_of_player.map {|player| player[:shoe]}.max()
  playerStats = array_of_player.find {|player| player[:shoe] == maxShoe}
  playerStats[:rebounds]
end

def most_points_scored
  maxPoints= array_of_player.map {|player| player[:points]}.max()
  playerStats = array_of_player.find {|player| player[:points] == maxPoints}
  playerStats[:player_name]
end

def wining_team
  homePointsTotal = home_team_players.map {|player| player[:points]}.sum()
  awayPointsTotal = away_team_players.map {|player| player[:points]}.sum()
  if homePointsTotal > awayPointsTotal
    puts game_hash[:home][:team_name]
  else
    puts game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  playerName = array_of_player.map {|player|  player[:player_name]}
  playerName.max_by {|name| name.length}
end

def long_name_steals_a_ton?
  maxSteals= array_of_player.map {|player| player[:steals]}.max()
  puts maxSteals
  playerLongestName = player_stats(player_with_longest_name)
  if playerLongestName[:steals] == maxSteals
    puts true 
  else
    puts false
  end
end