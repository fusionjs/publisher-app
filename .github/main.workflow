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
    NOW_ALIAS = "publisher-ci.now.sh"
    NOW_PROJECT = "publisher-app"
  }
  secrets = [
    "NOW_TOKEN",
    "NOW_TEAM",
    "WEBHOOK_SECRET",
    "APP_ID",
    "PRIVATE_KEY",
  ]
}
