# 💻 Scripting
A. Bash Script
• What does set -e do in a bash script?
• Create a logrotate with a bash script. This logrorate will :
◦ Check every .log file in the specific directory
◦ Checking file size. If the file size is greater than 5 MB, then the logrotate script will archive
it, and then truncate that file
◦ Logging script action

B. Program
• Rewrite your logrotate script above but with your preferred programming language

## 📄📄📄 QUIZ

What is below command do?
``` bash
set -e
```

## 📄📄📄 ANSWER

the set command is used to set or unset shell options and positional parameters, as well as to display the values of all shell variables. 

## 📦 Project Structure

├── logs         
    ├── ...      
├── log-rotate.sh
├── log-rotate.py
             
## 📖 Description

This script is used to manage log files automatically in a specific directory. Over time, log files can become very large and take up too much storage space. To prevent this problem, the script checks all files with a `.log` extension in `logs` folder and controls their size with log rotation.

The script works by scanning the target directory and examining each log file. It checks the size of every file, and if a file is larger than 5 MB, the script will process it for rotation. This ensures that only large files are handled, while smaller files are left unchanged.

When a log file exceeds the size limit, the script creates a compressed archive of the file using gzip in `archive` folder. A timestamp is added to the archive filename so that each backup is unique and easy to track. After archiving, the original log file is truncated, meaning its contents are cleared but the file itself remains. This allows the system or application to continue writing logs without interruption.

The script records all its actions in a separate log file. This includes when the script starts and finishes, as well as which files were processed or rotated. This logging feature helps users monitor the script’s behavior and troubleshoot any issues if needed. The script is provided by two languages, bash and python but the usage is same.

## 🧱 Run Ansible Task

Create dummy logs or copy the existing logs into `logs` folder. Then, execute the script.

``` bash
bash log-rotate.sh
```

or

``` bash
python log-rotate.py
```

Then, check on `logs/archive` folder.