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
    NOW_ALIAS = "publisher.now.sh"
    NOW_PROJECT = "publisher-app"
    NOW_TEAM = "publisher"
  }
  secrets = [
    "NOW_TOKEN",
    "WEBHOOK_SECRET",
    "PRIVATE_KEY",
    "APP_ID",
  ]
}
