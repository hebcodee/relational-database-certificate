#!/bin/bash

# PSQL variable for database queries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))


# Function to validate integer input
is_integer() {
    [[ $1 =~ ^[0-9]+$ ]]
}


# Get username
echo "Enter your username:"
read USERNAME

# Check if username exists
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]; then
    # New user
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    # Insert new user
    INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)")
else
    # Existing user
    IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start the game
echo "Guess the secret number between 1 and 1000:"
GUESSES=0

while true; do
    read GUESS
    ((GUESSES++))
    
    # Check if input is integer
    if ! is_integer "$GUESS"; then
        echo "That is not an integer, guess again:"
        continue
    fi
    
    # Compare guess with secret number
    if [[ $GUESS -eq $SECRET_NUMBER ]]; then
        echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        break
    elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
        echo "It's lower than that, guess again:"
    else
        echo "It's higher than that, guess again:"
    fi
done

# Update database
# Get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# Insert game record
INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses, secret_number) VALUES($USER_ID, $GUESSES, $SECRET_NUMBER)")

# Update user stats
# Get current games_played
CURRENT_GAMES=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
NEW_GAMES_PLAYED=$((CURRENT_GAMES + 1))

# Update best game
CURRENT_BEST=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
if [[ -z $CURRENT_BEST ]] || [[ $GUESSES -lt $CURRENT_BEST ]]; then
    UPDATE_USER=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$GUESSES WHERE user_id=$USER_ID")
else
    UPDATE_USER=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE user_id=$USER_ID")
fi
