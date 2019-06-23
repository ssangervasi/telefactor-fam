# Git Log

```
commit 10ae046b2e1e18c3473a7e37d538b93163479cdc
Author: Sebastian Sangervasi <ssangervasi@squareup.com>
Date:   Sat Jun 22 16:50:31 2019 -0700

    Result had a dumb bug
```

# CLOC


cloc|github.com/AlDanial/cloc v 1.82  T=0.04 s (1067.6 files/s, 50863.6 lines/s)
--- | ---

Language|files|blank|comment|code
:-------|-------:|-------:|-------:|-------:
Ruby|30|266|182|1169
Markdown|7|64|0|120
Bourne Again Shell|1|4|0|22
YAML|1|6|10|15
--------|--------|--------|--------|--------
SUM:|39|340|192|1326

# Spec Results

```

Fam::CLI::Add::Parents
  when the child and parent names are given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when all names are missing
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Add::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when no name is provided
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Get::Parents
  when a child name is given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when the child name is missing
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Get::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when the name is missing
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::File::Reader::JSONReader
  #read
    when the file does not exist
      raises an error
    when the file exists
      should be a kind of Hash

Fam::File::Writer::JSONWriter
  #write
    should be a kind of String
    modifies the specified file

Fam
  #add_person
    should be success
    writes the person name to the output file
  #add_parents
    should be success
    writes the new relationship to the output file
  #get_parents
    should be success
    returns each parent name on a line
  #get_grandparents
    with greatness 0
      should be success
      returns each grandparent name on a line
    with greatness 1
      should be success
      returns each great-grandparent name on a line

Fam::Family
  #add_person
    when the person is new
      adds a person
    when their name has already been added
      raises a duplicate person error
    adding many people
      includes them all
  #add_parent
    when adding people that are already in the family
      adds the parent
    when adding people who are not in the family
      raises a no such person error
    when the person already has two parents
      raises an excess parents error
  #get_grandparents
    when called without greatness
      just gets first level grandparents
    when called with greatness
      with greatness 1
        skips a generation
      with greatness 2
        runs out of levels and returns empty
  .from_h
    should be a kind of Fam::Family
    should include "Bart Simpson" and "Homer Simpson"

Finished in 15.68 seconds (files took 0.43113 seconds to load)
41 examples, 0 failures

```
