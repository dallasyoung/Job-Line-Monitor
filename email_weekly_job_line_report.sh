#!/bin/bash

cat /var/log/jobline/log | mail -s "Job report for $(date)" jhendy@ksp.ca
cat /var/log/jobline/log | mail -s "Job report for $(date)" dyoung@ksp.ca

logrotate /var/log/jobline/jobline.logrotate
