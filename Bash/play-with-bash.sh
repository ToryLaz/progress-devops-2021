#!/usr/bin/env bash 
#Nice to have options, which ensure safer, more predictable scripts
set -o errexit # Exit the script on error
set -o pipefail # Sets the pipeline as failed if any command in it fails
# Good explanations on the above options can be found here https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/


function say_bye(){
  echo "Bye"
}

function _variable_declaration(){
    var1="some_value"

    # Declare with different options can provide some kind of type safety in bash
    # The -r option sets the variable as read only (constant)
    declare -r var2=3

    # Array
    declare -a arr=(1 2 3 4 5)

    # append
    arr+=(6)

    # get all values from array
    arr_values=${arr[@]}

    echo "$arr_values"
    
    #print the second element of the array (arrays are zero based)
    echo ${arr[1]}
}


function _parameter_expansion(){
  Variable="Some string"
  echo ${Variable} # => Some string
  # This is a simple usage of parameter expansion
  # Parameter Expansion gets a value from a variable.
  # It "expands" or prints the value
  # During the expansion time the value or parameter can be modified
  # Below are other modifications that add onto this expansion

  # String substitution in variables
  echo ${Variable/Some/A} # => A string
  # This will substitute the first occurrence of "Some" with "A"

  # Substring from a variable
  Length=7
  echo ${Variable:0:Length} # => Some st
  # This will return only the first 7 characters of the value
  echo ${Variable: -5} # => tring
  # This will return the last 5 characters (note the space before -5)

  # String length
  echo ${#Variable} # => 11
  # Similarly we can get the lenght of an array. We use arr1[@] to get the whole array
  declare -a arr1=(1 2 3)
  echo ${#arr1[@]} #this will print the number of elements in the array

  # Default value for variable
  echo ${Foo:-"DefaultValueIfFooIsMissingOrEmpty"}
  # => DefaultValueIfFooIsMissingOrEmpty
  # This works for null (Foo=) and empty string (Foo=""); zero (Foo=0) returns 0.
  # Note that it only returns default value and doesn't change variable value.
}


function _pipefail(){
  # This function demonstrates the effect of the pipefail option
  # By default the exit code of a bash pipeline is the exit code of the last command
  # With set -o pipefail, the behavior is changed
  # For this function we will change the option to not exit on error
  set +o errexit
  set +o pipefail
  # this will tell us that foo does not exist, but will also print "hi" and "bye"
  foo | echo "hi"
  # The line below will print the exit code of previous command, which will be 0
  echo $?
  echo "bye"
  set -o pipefail
  # this will tell us that foo does not exist, but will also print "hi" and "bye"
  foo | echo "hi"
  # The line below will print the exit code of previous command, which will be non-zero
  echo $?
  echo "bye"
  set -o errexit
  # This will tell us that foo does not exist and will close the shell. It will still print hi
  foo | echo "hi"
}


# Aliases
function _aliases(){
  alias l="ls -la"
}

# Printf 
function _print_bye(){
  printf "%s\t%s\n" "Good" "Bye" "From" "Me"
}

# Incrementing a number
function _incrementer(){
i=$1
while [ true ]; do
  ((i++))
  printf "%d\n" $i
  sleep 5
done
}

# Read from file
function _read_file(){
  while IFS= read -r line
  do
    echo "$line"
  done < /proc/net/dev
}


# Write to file
## HERE doc
function _here_doc(){
cat > test.py <<EOF
import os
print(os.getcwd())
EOF
python3 test.py
}


function _argument_parsing(){
  echo "The number of arguments is $#"
  case "$1" in
    "development")
      echo "Dev"
    ;;
    "production")
      echo "Prod"
    ;;
    *)
      echo "Usage: $0 [production|development]"
  esac
}


# subshelling 
function _subshelling(){
  for n in {1..15};do
    echo $n; sleep 3
  done
}


# sourcing
function _helpful_vars(){
  # Set magic variables for current file & dir
  __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
  __base="$(basename ${__file} .sh)"
  printf "Dir - %s\nFile - %s\nBase - %s"  $__dir $__file $__base
}

