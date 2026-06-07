# DevOps Toolkit Repo

A collection of Bash automation scripts and DevOps utilities built as part of the Weekly Mini-Project (Part A — Local Track).

# The project demonstrates:

1. Linux shell scripting
2. User management automation
3. Log analysis
4. Backup automation
5. System monitoring
6. Nginx deployment
7. systemd services and timers
8. Git workflow and repository hygiene

# Repository Structure

```
.
├── scripts/ 
│   ├── backup.sh
│   ├── deploy.py
│   ├── log_parser.sh
│   ├── sysreport.sh
│   ├── user_manager.sh
│   ├── access.log    
│   └── users.csv
│
├── systemd/
│   ├── sysreport.timer
│   ├── sysreport.service
│   └── deploy.service
│
├── nginx/
│   └── deploy
│
│
├── README.md
├── DEMO.md
├── LICENSE
├── .gitignore
└── .env.example

```

# Light descriptin of folders and files:
## Scripts (folder)
Contains bash scripts with .sh extensions + some .log , .py and .csv files.
These extra files were meant to test some of .sh files for checking for their correct running.

### backup.sh
backup.sh is a Bash-based backup utility that creates compressed archives of directories and stores them in a specified backup location. The script automatically generates timestamped backups, helping maintain versioned snapshots of important files and directories.

##### Features
Creates compressed .tar.gz backups of any specified directory.
Generates unique backup filenames using timestamps.
Automatically creates the destination backup directory if it does not exist.
Logs all backup operations to a backup.log file.
Displays backup archive size after creation.
Includes input validation and error handling for missing directories or incorrect usage.

#### Usage
```
chmod +x backup.sh
./backup.sh <source-directory> <backup-directory>
```

### log_parser.sh
log_parser.sh is a Bash-based log analysis utility designed to extract key insights from web server access logs. The script processes a standard access log file and generates a concise summary of traffic patterns and error statistics.

#### Features
Displays the Top 10 client IP addresses by request count.
Shows the HTTP status code distribution.
Identifies the Top 10 requested URLs/endpoints.
Counts the total number of 4xx client errors.
Counts the total number of 5xx server errors.
Includes input validation and error handling for missing or invalid log files.
Uses common Unix utilities (awk, sort, uniq, wc) for efficient log processing.

#### Usage
```
chmod +x log_parser.sh
./log_parser.sh access.log
```

#### Note (access.log) :
The users.log file was created to test this file. Everyone can use this .log file to check and run the log_parser.sh

### sysreport.sh
A shell script that captures system health (disk, memory, CPU, top processes, network interfaces), runs every 5 minutes via a systemd timer, and logs to journalctl.
This is the build 1 .sh file

#### Usage
```
./sysreport.sh
```
#### Expected output:
```
=== HEALTH CHECK 2026-05-25T10:30:00+05:30 ===
[hostname] sumit-laptop
[uptime] up 2 days, 4 hours
[load]
0.42 0.55 0.61 2/812 12345
[memory]
Mem:           15Gi       4.2Gi       8.9Gi       312Mi       2.1Gi        10Gi
Swap:         2.0Gi          0B       2.0Gi
[disk]
Mounted on        Size  Used Avail Use%
/                 234G   84G  138G  38%
/boot             511M   53M  458M  11%
/home             450G  120G  308G  29%
[top-5-cpu]
    PID USER     %CPU %MEM CMD
   1234 sumit    12.3  2.1 chrome --type=renderer ...
   5678 sumit     8.7  4.5 code ...
   ...
[network]
lo               UNKNOWN        127.0.0.1/8 ::1/128
wlan0            UP             192.168.1.42/24
=== END 2026-05-25T10:30:00+05:30 ===
```
### deploy.py

Run a small web app under systemd, fronted by nginx as a reverse proxy on ports 80 and 443 with HTTPS.
This is the build 2 .py file

## user_manager.sh

user_manager.sh is a Bash-based system administration utility that automates Linux user account creation and deletion using a CSV file as input. It simplifies bulk user management tasks and reduces manual administrative effort.

### Features
Creates user accounts with home directories.
Deletes existing user accounts and their associated home directories.
Supports bulk operations through a CSV file.
Skips empty lines and comments for cleaner input files.
Validates file existence before execution.
Provides clear status messages for successful operations and errors.
Handles existing and non-existent users gracefully.
CSV Format

### The script expects a CSV file with the following structure:
```
create,john
create,alice
delete,bob

Comments and empty lines are ignored:
```

### User provisioning
```
create,john
create,alice
```

### User removal
```
delete,bob
Usage
chmod +x user_manager.sh
sudo ./user_manager.sh users.csv
Example Output
Created user 'john'
Created user 'alice'
Deleted user 'bob'
Supported Actions
Action	Description
create	Creates a new user account with a home directory
delete	Removes an existing user account and its home directory
```

## systemd
This contains build 1 and build 2 .timer and .service files.

## nginx
This contains nginx file for build 2.

## README.md
Description of all files, folders and project dexcription.

## DEMO.md
Contains Each picture of execution ouputs of each files in scripts folder.

## LICENSE
MIT based LICENSE

## .gitignore
The .gitignore file specifies files and directories that Git should exclude from version control.
## .env.example
Provides a template of required environment variables without exposing real credentials.
### NOTE
1. No api keys, URL links, etc. have been stated as those if created will no longer work on here.
2. So as an evidence of working demo file has been provided with photos of outputs of executed files.
3. .env was also used while processing for pushing on git but since the use of .gitignore restricted .env file to move to git here. 
    Hence, safe execution is executed. The .env.example file just tells about the crucial variables if used in project making.
