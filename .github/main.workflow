workflow "Deploy" {
  resolves = ["Deploy to Now"]
  on = "push"
}

action "Master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Deploy to Now" {
  uses = "./deploy"
  needs = ["Master"]
  env = {
    NOW_PROJECT = "publisher-app"
    NOW_ALIAS = "publisher-fusion.now.sh"
    NOW_TEAM = "fusionjs"
  }
  secrets = [
    "NOW_TOKEN",
    "WEBHOOK_SECRET",
    "PRIVATE_KEY",
    "APP_ID",
  ]
}
