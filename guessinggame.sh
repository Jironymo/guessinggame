#the function checks if the two numbers are equal. Exit statuses: 0 - equal; 1 - first is gt second; 2 - second is gt first
function numberCheck {
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

echo "Welcome to the guessing game, where you are tasked with finding out the number of files in the current directory."
echo "Please enter your guess of how many files are in the directory!"
read user_input
answer=$(ls -l | wc -l)
numbers_compared=$(numberCheck $user_input $answer)

while [[ $numbers_compared -ne 0 ]]
do
  if [[ $numbers_compared -eq 1 ]]
  then
    echo "Too much! Aim lower!"
  else
    echo "Too low! Aim higher!"
  fi

  echo "Please enter your guess of how many files are in the directory!"
  read user_input
  let numbers_compared=$(numberCheck $user_input $answer)
done
echo "Congrats! What a lucky devil!"





