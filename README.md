# ethereum-scripts

This is a collection of 1-off scripts that relate to ethereum research

# Design
The idea is to have a collection of uncouples scripts that follow a defined contract.
A script should be able to run (via cron or similar scheduling) completely independently
of anything other dependency (save for gems and database connection). Below is the
contract that scripts should adhere to.

```ruby
# Persist results in database table
def persist(results)
  #
end

# Log any critical data to a log rotated file. This should be errors, run time,
# and related data that may be needed in the event of an audit (URLs, important numbers, etc)
def log(level, data)
  #
end

# Entry point for running the script
def run()
  # Script core here

  log(level, data)
  persist(results)
end

# Always the last line in any script to kick off the process
run()
```

As it stands, reporting will most likely be done via queries across the db and most
likely will be its own set of scripts depending on what data is needed.

# TODO

1. ~~Define contract for producer (script) and consumer (most likely cron)~~
2. Define infrastructure/design
  - Set up database schema and migrations for scripts so data can be persisted
  - Set up log rotation for script logging
  - Add graph/histogram for data, presented as either email or (more likely) web page on server for all reported data
  - cron scripts that run on server, add logging for all sources
3. Break this out into something intelligible at some point (Rails app?).

# Ideas
- Number of ethereum/blockchain related job postings
- Naive bayes sentiment analysis (twitter, blogs)
- MS Azure blockchain announcements/development/adoption
- ~~Volume, market cap, sell/buy order numbers by week~~ [done, except for reporting]
- Google trends activity/mentions
- Specifically mentions of big bank and blockchain/ethereum integrations (ConsenSys, R3CEV)
- ~~Github dAPP creation per week?~~ [done, except for reporting]
- Track ethereum/blockchain companies, vc firms and investments (crunchbase data)
- reddit subscribers/size
  - https://www.coingecko.com/en
  - http://redditmetrics.com/r/ethereum
- ~~Number of meetups~~ [done, except for reporting]
- Number of followers on main @ethereum project
- ~~Ethereum network stats from https://etherchain.org/~~
- Use http://smmry.com/api to get daily tl;drs of top linked/voted/commented articles
