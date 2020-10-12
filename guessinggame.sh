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

#The function reads input only if it is a number and stores it in global user_input variable. Is intended to replace read.
function readInteger {
  echo "Enter an integer below:"
  read user_input
  #checking if input is valid. If not, prompt user for new input.
  numberCheckResult=$(isInteger $user_input)
  while [[ numberCheckResult -ne 0 ]]
  do
    echo "Given entry is not an integer. Please give a correct input below:"
    read user_input
    let numberCheckResult=$(isInteger $user_input)
  done
}

echo "Welcome to the guessing game, where you are tasked with finding out the number of files in the current directory."
readInteger
answer=$(ls -l | wc -l)

#comparing input value with the actual result.
numbers_compared=$(compareTwoNumbers $user_input $answer)
while [[ $numbers_compared -ne 0 ]]
do
  if [[ $numbers_compared -eq 1 ]]
  then
    echo "Too much! Aim lower!"
  else
    echo "Too low! Aim higher!"
  fi
  echo "Please enter your guess of how many files there are in this directory!"
  readInteger
  let numbers_compared=$(compareTwoNumbers $user_input $answer)
done
echo "Congrats! What a lucky devil!"
