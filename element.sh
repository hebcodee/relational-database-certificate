#!/bin/bash

# Check if argument is provided
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

# Set up PSQL variable
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if input is a number (atomic number)
if [[ $1 =~ ^[0-9]+$ ]]
then
  # Query by atomic number
  ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e INNER JOIN properties p USING(atomic_number) INNER JOIN types t USING(type_id) WHERE e.atomic_number = $1")
else
  # Check if input is a symbol (1-2 characters) or name
  if [[ ${#1} -le 2 ]]
  then
    # Query by symbol
    ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e INNER JOIN properties p USING(atomic_number) INNER JOIN types t USING(type_id) WHERE e.symbol = '$1'")
  else
    # Query by name
    ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e INNER JOIN properties p USING(atomic_number) INNER JOIN types t USING(type_id) WHERE e.name = '$1'")
  fi
fi

# Check if element was found
if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

# Parse the result (format: atomic_number|name|symbol|type|atomic_mass|melting_point|boiling_point)
echo $ELEMENT | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
