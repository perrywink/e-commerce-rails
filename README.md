# Student Details and Contribution
Seth Danford
s3845408
Contribution: 37%

Yi Jie Chuah
s3847905
Contribution: 63%

# Highest level attempted: DI

# Time Sheets
## Time Sheet (Yi Jie Chuah):
Date Start Time End Time Duration (hrs)
05/13 8:49:00 PM 10:52:00 PM 2:03:00
05/14 9:20:00 PM 10:15:00 PM 0:55:00
05/16 7:02:00 AM 9:04:00 AM 2:02:00
05/16 2:00:00 PM 6:55:00 PM 4:55:00
05/17 3:55:00 PM 7:08:00 PM 3:13:00
05/19 11:33:00 AM 1:48:00 PM 2:15:00
05/20 11:09:00 AM 3:09:00 PM 4:00:00
05/21 1:23:00 PM 4:24:00 PM 3:01:00
05/22 10:14:00 AM 11:28:00 AM 1:14:00
05/23 9:02:00 AM 2:14:00 PM 5:12:00
05/23 3:02:00 PM 7:57:00 PM 4:55:00
05/23 9:12:00 AM 2:22:00 PM 5:10:00
Total Time Spent: 38:55:00

## Time Sheet (Seth Danford):
Date Start Time End Time Duration (hrs)
05/13 3:22:00 PM 4:34:00 PM 1:12:00
05/14 11:30:00 PM 12:15:00 AM 0:45:00
05/16 11:43:00 AM 1:37:00 PM 1:54:00
05/16 2:00:00 PM 6:55:00 PM 4:55:00
05/17 8:43:00 PM 11:08:00 PM 2:25:00
05/19 10:33:00 PM 12:06:00 AM 1:33:00
05/20 10:02:00 AM 12:07:00 PM 2:05:00
05/21 10:20:00 PM 11:02:00 PM 0:42:00
05/22 10:01:00 AM 11:15:00 AM 1:14:00
05/23 9:56:00 AM 1:08:00 PM 3:12:00
05/23 3:02:00 PM 7:57:00 PM 4:55:00
05/23 9:12:00 AM 2:22:00 PM 5:10:00
Total Time Spent: 30:02:00

# Heroku Deployment URL:
https://rad-raindrops-proj.herokuapp.com/

# Last Heroku deployment Log:
2021-05-23T10:23:11.000000+00:00 app[api]: Build started by user s3847905@student.rmit.edu.au
2021-05-23T10:23:42.593093+00:00 app[api]: Deploy f0426ba9 by user s3847905@student.rmit.edu.au
2021-05-23T10:23:42.593093+00:00 app[api]: Release v14 created by user s3847905@student.rmit.edu.au
2021-05-23T10:23:42.847517+00:00 heroku[web.1]: Restarting
2021-05-23T10:23:42.854182+00:00 heroku[web.1]: State changed from up to starting
2021-05-23T10:23:43.926093+00:00 heroku[web.1]: Stopping all processes with SIGTERM
2021-05-23T10:23:44.003271+00:00 app[web.1]: - Gracefully stopping, waiting for requests to finish
2021-05-23T10:23:44.010573+00:00 app[web.1]: === puma shutdown: 2021-05-23 10:23:44 +0000 ===
2021-05-23T10:23:44.010577+00:00 app[web.1]: - Goodbye!
2021-05-23T10:23:44.010677+00:00 app[web.1]: Exiting
2021-05-23T10:23:44.106680+00:00 heroku[web.1]: Process exited with status 143
2021-05-23T10:23:50.060035+00:00 heroku[web.1]: Starting process with command `bin/rails server -p ${PORT:-5000} -e production`
2021-05-23T10:23:51.000000+00:00 app[api]: Build succeeded
2021-05-23T10:24:01.076017+00:00 heroku[web.1]: State changed from starting to up

# Git repository:
RAD_s3847905_s3845408
https://github.com/YiJieChuah/RAD_s3847905_s3845408

# Additional points about our Rails app
- Make sure to run rails db:seed to populate the app with data, including attaching images in `app/assets/images` (and re-uploading them to the s3 bucket)
- There is an admin account from the seed file with username: "admin" and password: "password". This account has access to restricted pages like `items/new`
- `master.key` is `adb9083e377c90d019bc025f5f58250d`. This is required for `gmail smtp`, `aws s3` and `twitter oauth` to work properly
