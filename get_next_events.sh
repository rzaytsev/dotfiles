#!/bin/bash

/usr/local/bin/icalBuddy -n -npn -nc -iep "title,datetime" -ps "|=|" -po "datetime,title" \
  -tf "=%H.%M" -df "" -eed eventsToday+ |tr -d . |head -n 1 | awk -F "=" '{print substr($2,0,5)" "substr($3,0,12)}' > ~/.next_event
