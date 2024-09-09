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

	if [[ $currentHour -ge $sunRiseStart && $currentHour -lt $sunRiseEnd ]]
	then
		echo "It's sun rise/sun set time"
		$(gsettings set org.cinnamon.desktop.background picture-uri  $sunRisePath)
		sleepTime="$(( (($sunRiseEnd-$currentHour)*60*60)-$currentMinute*60 ))"
		echo "will sleep for $sleepTime s"
		sleep $sleepTime
	else
		if [[ $currentHour -ge $dayStart && $currentHour -lt $dayEnd ]]
		then
			echo "It's day time"
			$(gsettings set org.cinnamon.desktop.background picture-uri $dayPath)
			sleepTime="$(( (($dayEnd-$currentHour)*60*60)-($currentMinute*60) ))"
			echo "will sleep for $sleepTime s"
			sleep $sleepTime
		else
			if [[ $currentHour -ge $sunSetStart && $currentHour -lt $sunSetEnd ]]
			then
				echo "It's sun set time"
				$(gsettings set org.cinnamon.desktop.background picture-uri  $sunRisePath)
				sleepTime="$(( (($sunSetEnd-$currentHour)*60*60)-($currentMinute*60) ))"
				echo "will sleep for $sleeptime s"
				sleep $sleepTime
			else
				$(gsettings set org.cinnamon.desktop.background picture-uri $nightPath)
				if [[ $currentHour -ge $nightStart && $currentHour -le 23 ]]
				then
					echo "It's night time"
					sleepTime="$(( ((24+$nightEnd-$currentHour)*60*60)-($currentMinute*60) ))"
					echo "Will sleep for $sleepTime s"
					sleep $sleepTime
				else
					echo "It's madruga time"
					sleepTime="$(( (($nightEnd-$currentHour)*60*60)-($currentMinute*60) ))"
					echo "Will sleep for $sleepTime"
					sleep $sleepTime
				fi
			fi
		fi
	fi
done
