#!/bin/sh
  INPUT_STRING=$1
  case $INPUT_STRING in
        produce)
		cd $MKDOCS_HOME
                tar -czvf produced.tar.gz docs/ site/ mkdocs.yml
                ;;
        serve)
		cd $MKDOCS_HOME
        	tar -C / -xvzf produced.tar.gz
                mkdocs $1 --dev-addr=0.0.0.0:8000
                break
                ;;
        *)
                echo "Sorry, I don't understand"
                ;;
  esac
