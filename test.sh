#The function compares two numbers given as first two params. Exit status: 0 - equal; 1 - first is gt second; 2 - second is gt first.
function compareTwoNumbers {
  result=0
  if [[ $1 -gt $2 ]]
  then
    let result=1
  elif [[ $1 -lt $2 ]]
  then
    let result=2
  fi
echo $result
}

#The function checks if the input is an integer. Exit status: 0 - true; 1 - false.
function isInteger {
  if [[ $1 =~ ^[+-]*[0-9]+$ ]]
  then
    echo 0
  else
    echo 1
  fi
}

#The function reads input only if it is a number and stores it in global user_integer variable. Is intended to replace read.
function readInteger {
  echo "Enter an integer below:"
  read user_integer
  #checking if input is valid. If not, prompt user for new input.
  numberCheckResult=$(isInteger $user_integer)
  while [[ numberCheckResult -ne 0 ]]
  do
    echo "Given entry is not an integer. Please give a correct input below:"
    read user_integer
    let numberCheckResult=$(isInteger $user_integer)
  done
  echo $user_integer
}

#readInteger
user_input=$(readInteger)
echo "user_input: $user_input"
