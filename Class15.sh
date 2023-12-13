which echo
/usr/bin/echo (fully qualified command for echo = full path to that command)
which date
/usr/bin/date

# - it is considered to not use Fully Qualified Command 
# 2 reasons to use fully qualified commands in our scripts
# - 1 = security 
# - 2 = PATH variable (your Path variable may not be able to locate your commands)

# when CRON runs a job it might not run in standard shell environment 
# - it is better to use fully qualified command names 

# m h dom mon dow command
# 30 1 * * 5 /usr/local/bin/script
