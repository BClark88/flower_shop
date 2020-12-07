# Flower Shop

## Known limitations
My solution involves a bit of ruby-magic involving hashes. Unfortunately I couldn't come up with a better solution. \
Trying recursive solutions meant large numbers couldn't be handled. At least this can handle relatively large numbers.

## Requirements
* Ruby 2.7.2
* Bundler

If you use `Rbenv` to manage your ruby installations, you can change the version used via the `.ruby-version` file

## Testing
`bundle exec rake`

## How to run
`ruby app.rb` will load a basic CLI that you can use to play around with my solution \
Running this task will check for rubocop linter errors, as well as run all tests

## Other deficiencies
`lib/application` uses a continuous loop to handle user input. Unfortunately it appears that these loops cannot \
be reliably tested using Rspec, so this class remains untested. An alternative would be to force the user to load \
a csv file instead of creating a CLI, but that would be a bad user experience.
