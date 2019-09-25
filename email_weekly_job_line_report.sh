#!/bin/bash

cat /var/log/jobline/log | mail -s "Job report for $(date)" jhendy@ksp.ca
cat /var/log/jobline/log | mail -s "Job report for $(date)" dyoung@ksp.ca
# cat /var/log/jobline/log | mail -s "Job report for $(date)" <your email here>
# ...

logrotate /var/log/jobline/jobline.logrotate
