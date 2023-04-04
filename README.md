# [WIP] CaRePi2

<u>**Ca**</u>rd <u>**Re**</u>ader de <u>**Pi**</u> suruyatu 2.

~~ふたりめのかれぴ~~

# Specification

- Ruby 3.1.2
- Rails 7.0.4

# Setup

## Create Slack app

### Scope

- channels:history
- chat:write
- users:read
- users:read.email

## Invite to Slack

go to `/slack/invite`
push "Add to Slack"
get code from '?code'

```bash
curl -X POST -H "application/x-www-form-urlencoded" -d "client_id=CLIENT_ID&client_secret=CLIENT_SECRET&code=CODE&redirect_uri=https://www.shmn7iii.net/slack/carepi_v2_test" https://slack.com/api/oauth.v2.access
```

# Deployment

```bash
# install dependency
$ sudo apt install curl git make

# install docker
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh

# clone
$ git clone https://github.com/shmn7iii/carepi2.git

# set .env
$ cat << EOF > .env
ADMIN_DASHBOARD_USER=user
ADMIN_DASHBOARD_PASSWORD=password
DEFAULT_EMAIL_DOMAIN=@example.com
SLACK_CHANNEL_ID=HOGEHOGEHOGE
SLACK_ACCESS_TOKEN=FUGAFUGAFUGA
EOF

# upload master.key
[local]$ cd ./config
[local]$ sftp carepi2
Connected to carepi2.
sftp> cd carepi2/config
sftp> put master.key
Uploading master.key to /home/ubuntu/carepi2/config/master.key
master.key                                                                                                          100%   32     1.1KB/s   00:00

# setup container
$ sudo make prod/docker/up
```
