# SE-project
# Linux Resource Monitoring Script  

## 📌 Project Overview  
This project automates system resource monitoring on Linux using **Bash scripting**. The script checks **CPU usage, RAM consumption, and disk space**, logs system data, and sends alerts if any threshold is exceeded. Additionally, it can clean up high-memory usage processes.

## 🚀 Features  
✅ Monitors **CPU, RAM, and Disk usage** in real-time  
✅ Logs system usage data into `/var/log/resource_monitor.log`  
✅ Sends **email alerts** if any resource exceeds predefined thresholds  
✅ Automatically **terminates high-memory processes**  
✅ Can be **automated using crontab** for scheduled execution  

## 🛠️ Technologies Used  
- **Bash (Shell Scripting)**  
- **Linux Utilities** (`top`, `awk`, `grep`, `df`, `mail`, `ps`, etc.)  
- **GitHub for Version Control**  
- **Crontab** for automation  

## 📂 Project Structure  
linux-automation-monitoring/ │-- monitor.sh # Main script for resource monitoring │-- README.md # Project documentation │-- LICENSE # License information (optional) │-- .gitignore # Ignore unnecessary files in Git

## 📝 Prerequisites  
Before running the script, make sure you have:  
- **Linux-based OS** (Ubuntu, Debian, CentOS, etc.)  
- Installed utilities: `top`, `awk`, `grep`, `df`, `mail`, `ps`  
- **Git** installed for version control  
- Email setup for sending alerts (`mail` command)  




