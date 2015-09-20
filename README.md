# SimpleCovChecker

[![Build Status](https://travis-ci.org/gtd/simplecov_checker.svg)](https://travis-ci.org/gtd/simplecov_checker)
[![Code Climate](https://codeclimate.com/github/gtd/simplecov_checker/badges/gpa.svg)](https://codeclimate.com/github/gtd/simplecov_checker)
[![Test Coverage](https://codeclimate.com/github/gtd/simplecov_checker/badges/coverage.svg)](https://codeclimate.com/github/gtd/simplecov_checker/coverage)

This gem provides an eponymous class which iterates through a given directory checking for .rb files which are not
listed in the latest SimpleCov resultset.

## Installation

The recommended thing is to just install it and run directly without adding it to your Gemfile.

    $ gem install simplecov_checker

Of course if you to add any automation (eg. CI warnings) you may want to do the usual Gemfile dance, but that is left as
an exercise to the reader.

## Usage

Running via shell is a one-liner:

    $ ruby -rsimplecov_checker -e 'puts SimpleCovChecker.new.missed_files'

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gtd/simplecov_checker.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
