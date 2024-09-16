#!/bin/bash

dayPath='file:///usr/share/backgrounds/steven-universe/day.png'
sunRisePath='file:///usr/share/backgrounds/steven-universe/sunRise_sunSet.jpg'
nightPath='file:///usr/share/backgrounds/steven-universe/night.jpg'

#Sun Rise
sunRiseStart=4
sunRiseEnd=6

#Day
dayStart="$sunRiseEnd"
dayEnd=17

#Sun Set
sunSetStart="$dayEnd"
sunSetEnd=18

#Night
nightStart="$sunSetEnd"
nightEnd="$sunRiseStart"

while true
do

	#Get current time
	currentHour="$(date +"%H")"
	currentMinute="$(date +"%M")"

	if [[ ${currentHour#0} -ge ${sunRiseStart#0} && ${currentHour#0} -lt ${sunRiseEnd#0} ]]
	then
		echo "It's sun rise/sun set time"
		$(gsettings set org.cinnamon.desktop.background picture-uri  $sunRisePath)
		sleepTime="$(( (((10#$sunRiseEnd)-(10#$currentHour))*60*60)-((10#$currentMinute)*60) ))"
		echo "will sleep for $sleepTime s"
		sleep $sleepTime
	else
		if [[ ${currentHour#0} -ge ${dayStart#0} && ${currentHour#0} -lt ${dayEnd#0} ]]
		then
			echo "It's day time"
			$(gsettings set org.cinnamon.desktop.background picture-uri $dayPath)
			sleepTime="$(( (((10#$dayEnd)-(10#$currentHour))*60*60)-((10#$currentMinute)*60) ))"
			echo "will sleep for $sleepTime s"
			sleep $sleepTime
		else
			if [[ ${currentHour#0} -ge ${sunSetStart#0} && ${currentHour#0} -lt ${sunSetEnd#0} ]]
			then
				echo "It's sun set time"
				$(gsettings set org.cinnamon.desktop.background picture-uri  $sunRisePath)
				sleepTime="$(( (((10#$sunSetEnd)-(10#$currentHour))*60*60)-((10#$currentMinute)*60) ))"
				echo "will sleep for $sleepTime s"
				sleep $sleepTime
			else
				$(gsettings set org.cinnamon.desktop.background picture-uri $nightPath)
				if [[ ${currentHour#0} -ge ${nightStart#0} && ${currentHour#0} -le 23 ]]
				then
					echo "It's night time"
					sleepTime="$(( ((24+(10#$nightEnd)-(10#$currentHour))*60*60)-((10#$currentMinute)*60) ))"
					echo "Will sleep for $sleepTime s"
					sleep $sleepTime
				else
					echo "It's madruga time"
					sleepTime="$(( (((10#$nightEnd)-(10#$currentHour))*60*60)-((10#$currentMinute)*60) ))"
					echo "Will sleep for $sleepTime"
					sleep $sleepTime
				fi
			fi
		fi
	fi
done
