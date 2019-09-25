# Job Line Monitor
###### For FreePBX/Asterisk-based phone systems

Developed for [KSP Technology](https://www.ksp.ca), these scripts parse Asterisk logs daily to determine the volume of calls received for a Customer's Job Line (an Announcement module available in their Main IVR). Generated logs are compressed and stored in _/var/log/jobline_ for 1 year for reporting purposes. 

### Deployment

Simply clone this Github repository to the target PBX and move the scripts and _.logrotate_ files to the desired directory. The script names are self-explanitory and can be deployed as cron jobs to suit your schedule. Assuming the scripts are moved to the root ```('/')``` directory, consult the _crontab_ file for an example configuration. 
