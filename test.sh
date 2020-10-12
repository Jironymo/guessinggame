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

echo "enter a number"
read user_input

myvar=$(numberCheck $user_input 4)
echo "$myvar"
