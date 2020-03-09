#!/bin/sh
  INPUT_STRING=$1
  case $INPUT_STRING in
        produce)
                sudo docker run --rm -it -v ${PWD}/mkdocs_home:/var/mkdocs_home jitu/mkdocs produce
                ;;
        serve)
		docker run --rm -d -p 8000:8000 -v ${PWD}/mkdocs_home:/var/mkdocs_home jitu/mkdocs serve
                break
                ;;
        *)
                echo "Sorry, I don't understand"
                ;;
  esac

