#!/bin/bash

if [[ $1 != 'setup' ]];
then

  echo 'Argument unrecognized; this script only runs under "./devdom.sh setup"'
  exit 1

elif [[ $1 == 'setup' ]];
then

  # setup has been called
  if [ -f ~/.bashrc ];
  then

    # verify we haven't been here before
    if [[ $(grep "devdom" ~/.bashrc | wc -l) == '0' ]];
    then

      # first run confirmed! make sure we cloned the necessary folder depencency
      if [[ -d .devdom ]];
      then

        cp -r .devdom ~/.devdom

      else

        echo "Unable to detect the .devdom folder; did you clone the full repository from https://github.com/angela-d/devdom?"
        exit 1

      fi

      # do the setup process and initiate an environment variable so we can call this script by an alias for fast access
      # it is assumed that where we're running devdom is where it will live
      echo "source ~/.devdom/function-builder" >> ~/.bashrc
      echo -e "Configuration completed, now run: . ~/.bashrc\nThis will refresh your current shell, without logging out; so we can use devdom commands.\n \
      \tRun: . ~/.bashrc\n \
      \tThen, run: devdom domain createthisdomain.test (replace createthisdomain.test for whatever the URL is you wish to use)"
    else

      echo "Devdom support is already enabled, no need to run setup again."
      exit 0

    fi

  else

    # bashrc doesn't exist, so the likely destination is bash_profile.
    echo "source ~/.devdom/function-builder" >> ~/.bash_profile
    echo -e "Configuration completed, now run: . ~/.bash_profile\nThis will refresh your current shell, without logging out; so we can use devdom commands.\n \
    \tRun: . ~/.bash_profile\n \
    \tThen, run: devdom domain createthisdomain.test (replace createthisdomain.test for whatever the URL is you wish to use)"

  fi

else

  echo -e "To utilize Devdom, run at least two arguments:\n\tdevdom domain createthisdomain.test"
  exit 1

fi
