# Flower Shop

## Known limitations
My solution involves a bit of ruby-magic involving hashes. Unfortunately I couldn't come up with a better solution \
Trying recursive solutions meant large numbers couldn't be handled. At least this can handle relatively large numbers.

## Requirements
* Ruby 2.7.2
* Bundler

If you use `Rbenv` to manage your ruby installations, you can change the version used via the `.ruby-version` file

## Testing
`bundle exec rake`

Running this task will check for rubocop linter errors, as well as run all tests

