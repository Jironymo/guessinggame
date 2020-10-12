#The function checks if the input is a positive integer.
#Exit status: 0 - true; 1 - false.
function isInteger {
  if [[ $1 =~ ^[+-]*[0-9]+$ ]]
  then
    echo 0
  else
    echo 1
  fi
}

#The function reads input only if it is a number.
function readInteger {
  echo "Enter an integer below:"
  read user_input
  #checking if input is valid. If not, prompt user for new input.
  numberCheckResult=$(isInteger $user_input)
  while [[ numberCheckResult -ne 0 ]]
  do
    echo "Given entry is not a positive integer. Please give a correct input below:"
    read user_input
    let numberCheckResult=$(isInteger $user_input)
  done
}

readInteger myinp
echo $user_input
