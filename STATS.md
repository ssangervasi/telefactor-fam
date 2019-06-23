# Git Log

```
commit a2cbf99e5e743fc12cfac078373fc4481f227eba
Author: Sebastian Sangervasi <ssangervasi@squareup.com>
Date:   Sat Jun 22 17:21:07 2019 -0700

    Removed the tests
```

# CLOC


cloc|github.com/AlDanial/cloc v 1.82  T=0.04 s (1074.6 files/s, 42763.3 lines/s)
--- | ---

Language|files|blank|comment|code
:-------|-------:|-------:|-------:|-------:
Ruby|30|211|182|911
Markdown|7|64|0|120
Bourne Again Shell|1|5|0|28
YAML|1|6|10|15
--------|--------|--------|--------|--------
SUM:|39|286|192|1074

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

Finished in 14.16 seconds (files took 0.38512 seconds to load)
20 examples, 0 failures

```

