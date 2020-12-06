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

Running this task will check for rubocop linter errors, as well as run all tests

## Other deficiencies
I ended up running out of time so I couldn't take the time to write a nice, clean CLI. \
Arguably `app.rb` should have unit tests. I tried methods of testing within a loop, but none of them worked well. \
Code that's hard to test is poorly written code, if I had more time I'd consider a more testable appraoch.
