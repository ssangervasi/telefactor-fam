

## Setup

### 1. Ensure you have Ruby 2.6 and Bundler 2.

You're probably going to want to use RVM or rbenv to manage this.

### 2. Install

```sh
bundle install
```

Note: this and all commands listed here are run from the project root directory,
that is, the one which contains `fam.gemspec`.

### 3. Run

```sh
bundle exec fam
```

Or

```sh
./exe/fam
```

Both should work.

The default output will be a help with a summary of the commands that we'll implement.

### 4. Test

Run all the tests:

```sh
bundle exec rspec
```

Run the tests which testers are supposed to write:

```sh
bundle exec rspec spec/family
```

Run the CLI tests which don't change between rounds:

```sh
bundle exec rspec spec/cli 
```

### 5. Lint

```sh
bundle exec rubocop
```

Want to automatically conform to the project style? Run this:

```sh
bundle exec rubocop --auto-correct
```
