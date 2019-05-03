workflow "Deploy" {
  on = "push"
  resolves = ["Deploy to Now"]
}

action "Master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Deploy to Now" {
  uses = "./deploy"
  needs = ["Master"]
  env = {
    APP_NAME = "publisher-ci"
    APP_ID = "@publisher/app"
  }
  secrets = [
    "NOW_TOKEN",
    "NOW_TEAM",
    "WEBHOOK_SECRET",
    "APP_ID",
    "PRIVATE_KEY",
  ]
}
