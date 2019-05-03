workflow "Deploy" {
  on = "push"
  resolves = ["Deploy to Now"]
}

action "Master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Deploy to Now" {
  uses = "./"
  needs = ["Master"]
  secrets = ["NOW_TOKEN", "APP_NAME", "APP_URL", "NOW_TEAM", "WEBHOOK_SECRET", "APP_ID", "PRIVATE_KEY"]
}
