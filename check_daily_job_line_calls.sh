#!/bin/bash

job_line_log_file="/var/log/jobline/log"
asterisk_log_file="/var/log/asterisk/full"
date=$(date)

job_line_call_count=$(grep "Playing announcement Job Line Main" /var/log/asterisk/full | wc -l)
announcement_logs=$(grep "Playing announcement Job Line Main" /var/log/asterisk/full)

echo $date: $job_line_call_count job line calls >> $job_line_log_file

if [ $job_line_call_count -gt 0 ]; then
	while read -r line; do
		#echo $line

		timestamp="$(echo $line | cut -d' ' -f1)"
		timestamp="$timestamp $(echo $line | cut -d' ' -f2)"
		#echo $timestamp

		sip_channel=$(echo $line | cut -d'"' -f2)
		#echo $sip_channel

		# todo(dallas): sanity check
		# grep "$sip_channel" "$asterisk_log_file" | grep "DIRECTION=INBOUND" | cut -d'xxx' -f9

		external_did="$(grep "$sip_channel" "$asterisk_log_file" | grep "CALLERID(name)" | cut -d'"' -f4 | cut -d'=' -f2)"
		# note(dallas): Thank you ByteFreaks: https://bytefreaks.net/gnulinux/bash/remove-the-last-character-from-a-bash-variable
		external_did=${external_did%?}
		#echo $external_did

		echo -e "\t$timestamp\t$external_did ($sip_channel)" >> $job_line_log_file
	# note(dallas): Thank you StackOverflow: https://stackoverflow.com/questions/613572/capturing-multiple-line-output-into-a-bash-variable#answer-613580
	done <<< "$announcement_logs"
	# else, no jobline calls, nothing to do
fi
