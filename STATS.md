# Git Log

```
commit 648441b90c7fe05e9113cef3371e5c736f483919
Author: Sebastian Sangervasi <ssangervasi@squareup.com>
Date:   Sat Jun 22 17:10:31 2019 -0700

    Let's generate stats
```

# CLOC


cloc|github.com/AlDanial/cloc v 1.82  T=0.03 s (1109.4 files/s, 48694.3 lines/s)
--- | ---

Language|files|blank|comment|code
:-------|-------:|-------:|-------:|-------:
Ruby|28|219|180|977
Markdown|7|64|0|120
Bourne Again Shell|1|5|0|28
YAML|1|6|10|15
--------|--------|--------|--------|--------
SUM:|37|294|190|1140

# Spec Results

```

Fam::CLI::Add::Parents
  when the child and parent names are given
    behaves like a successful command
      exits with a zero status code (FAILED - 1)
      matches the expected output (FAILED - 2)
  when all names are missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 3)
      matches the expected error (FAILED - 4)

Fam::CLI::Add::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 5)
      matches the expected output (FAILED - 6)
  when no name is provided
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Get::Parents
  when a child name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 7)
      matches the expected output (FAILED - 8)
  when the child name is missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 9)
      matches the expected error (FAILED - 10)

Fam::CLI::Get::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 11)
      matches the expected output (FAILED - 12)
  when the name is missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 13)
      matches the expected error (FAILED - 14)

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
    should be success (FAILED - 15)
    writes the person name to the output file (FAILED - 16)
  #add_parents
    should be success (FAILED - 17)
    writes the new relationship to the output file (FAILED - 18)
  #get_parents
    should be success (FAILED - 19)
    returns each parent name on a line (FAILED - 20)
  #get_grandparents
    with greatness 0
      should exist (FAILED - 21)
      returns each grandparent name on a line (FAILED - 22)
    with greatness 1
      should exist (FAILED - 23)
      returns each great-grandparent name on a line (FAILED - 24)

Fam::Family
  #add_person
    when the person is new
      adds a person (FAILED - 25)
    when their name has already been added
      raises a duplicate person error (FAILED - 26)
    adding many people
      includes them all (FAILED - 27)
  #add_parent
    when adding people that are already in the family
      adds the parent (FAILED - 28)
    when adding people who are not in the family
      raises a no such person error (FAILED - 29)
    when the person already has two parents
      raises an excess parents error (FAILED - 30)
  #get_grandparents
    when called without greatness
      just gets first level grandparents (FAILED - 31)
    when called with greatness
      with greatness 1
        skips a generation (FAILED - 32)
      with greatness 2
        runs out of levels and returns empty (FAILED - 33)
  .from_h
    example at ./spec/fam/family_spec.rb:163 (FAILED - 34)
    example at ./spec/fam/family_spec.rb:164 (FAILED - 35)

Failures:

  1) Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command exits with a zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/parents_spec.rb:25
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  2) Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command matches the expected output
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/parents_spec.rb:25
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  3) Fam::CLI::Add::Parents when all names are missing behaves like a failed command exits with a non-zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/add/parents_spec.rb:35
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  4) Fam::CLI::Add::Parents when all names are missing behaves like a failed command matches the expected error
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/add/parents_spec.rb:35
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  5) Fam::CLI::Add::Person when a name is given behaves like a successful command exits with a zero status code
     Failure/Error: expect(subject.status).to eq(0), (subject.output + subject.error)
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/person_spec.rb:13
     # ./spec/spec_helpers/cli.rb:28:in `block (3 levels) in <top (required)>'

  6) Fam::CLI::Add::Person when a name is given behaves like a successful command matches the expected output
     Failure/Error: expect(subject.output).to match expected_output
       expected "" to match "José Exemplo"
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/person_spec.rb:13
     # ./spec/spec_helpers/cli.rb:32:in `block (3 levels) in <top (required)>'

  7) Fam::CLI::Get::Parents when a child name is given behaves like a successful command exits with a zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/parents_spec.rb:33
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  8) Fam::CLI::Get::Parents when a child name is given behaves like a successful command matches the expected output
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/parents_spec.rb:33
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  9) Fam::CLI::Get::Parents when the child name is missing behaves like a failed command exits with a non-zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/parents_spec.rb:43
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  10) Fam::CLI::Get::Parents when the child name is missing behaves like a failed command matches the expected error
      Failure/Error:
        expect(
          Hatchery::Names.simpsons.map do |person_name|
            exec_fam('add', 'person', person_name)
          end
        ).to(
          all(be_success),
          'Must be able to `add person` before testing `get parents`'
        )

        Must be able to `add person` before testing `get parents`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/parents_spec.rb:43
      # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  11) Fam::CLI::Get::Person when a name is given behaves like a successful command exits with a zero status code
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/person_spec.rb:21
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  12) Fam::CLI::Get::Person when a name is given behaves like a successful command matches the expected output
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/person_spec.rb:21
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  13) Fam::CLI::Get::Person when the name is missing behaves like a failed command exits with a non-zero status code
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/person_spec.rb:31
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  14) Fam::CLI::Get::Person when the name is missing behaves like a failed command matches the expected error
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/person_spec.rb:31
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  15) Fam#add_person should be success
      Failure/Error: it { is_expected.to be_success }
        expected `#<Fam::CLI::Result:0x00007ff3970c3f40 @output="", @error="", @status=1>.success?` to return true, got false
      # ./spec/fam/fam_spec.rb:31:in `block (3 levels) in <top (required)>'

  16) Fam#add_person writes the person name to the output file
      Failure/Error: JSON.parse(output_pathname.read, symbolize_names: true)

      Errno::ENOENT:
        No such file or directory @ rb_sysopen - /var/folders/63/dd2qjczj74v6q659c2t429hc0000gn/T/tempdir20190622-54156-yr9kak/family-out.json
      # ./spec/fam/fam_spec.rb:17:in `read'
      # ./spec/fam/fam_spec.rb:17:in `read'
      # ./spec/fam/fam_spec.rb:17:in `block (2 levels) in <top (required)>'
      # ./spec/fam/fam_spec.rb:36:in `block (3 levels) in <top (required)>'

  17) Fam#add_parents should be success
      Failure/Error: it { is_expected.to be_success }
        expected `#<Fam::CLI::Result:0x00007ff3970e28a0 @output="", @error="", @status=1>.success?` to return true, got false
      # ./spec/fam/fam_spec.rb:69:in `block (3 levels) in <top (required)>'

  18) Fam#add_parents writes the new relationship to the output file
      Failure/Error: JSON.parse(output_pathname.read, symbolize_names: true)

      Errno::ENOENT:
        No such file or directory @ rb_sysopen - /var/folders/63/dd2qjczj74v6q659c2t429hc0000gn/T/tempdir20190622-54156-1if0k3u/family-out.json
      # ./spec/fam/fam_spec.rb:17:in `read'
      # ./spec/fam/fam_spec.rb:17:in `read'
      # ./spec/fam/fam_spec.rb:17:in `block (2 levels) in <top (required)>'
      # ./spec/fam/fam_spec.rb:74:in `block (3 levels) in <top (required)>'

  19) Fam#get_parents should be success
      Failure/Error: it { is_expected.to be_success }
        expected `#<Fam::CLI::Result:0x00007ff3981e9158 @output="", @error="", @status=1>.success?` to return true, got false
      # ./spec/fam/fam_spec.rb:120:in `block (3 levels) in <top (required)>'

  20) Fam#get_parents returns each parent name on a line
      Failure/Error: expect(lines).to match_array(parent_names)

        expected collection contained:  ["Homer Simpson", "Marge Simpson"]
        actual collection contained:    []
        the missing elements were:      ["Homer Simpson", "Marge Simpson"]
      # ./spec/fam/fam_spec.rb:124:in `block (3 levels) in <top (required)>'

  21) Fam#get_grandparents with greatness 0 should exist
      Failure/Error: Fam::Family::Person.new(name: name)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:115:in `block (2 levels) in generations'
      # ./spec/spec_helpers/hatchery.rb:113:in `each'
      # ./spec/spec_helpers/hatchery.rb:113:in `map'
      # ./spec/spec_helpers/hatchery.rb:113:in `block in generations'
      # ./spec/spec_helpers/hatchery.rb:111:in `each'
      # ./spec/spec_helpers/hatchery.rb:111:in `map'
      # ./spec/spec_helpers/hatchery.rb:111:in `generations'
      # ./spec/spec_helpers/hatchery.rb:99:in `great_big_family'
      # ./spec/fam/fam_spec.rb:137:in `block (3 levels) in <top (required)>'
      # ./spec/fam/fam_spec.rb:13:in `block (2 levels) in <top (required)>'

  22) Fam#get_grandparents with greatness 0 returns each grandparent name on a line
      Failure/Error: Fam::Family::Person.new(name: name)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:115:in `block (2 levels) in generations'
      # ./spec/spec_helpers/hatchery.rb:113:in `each'
      # ./spec/spec_helpers/hatchery.rb:113:in `map'
      # ./spec/spec_helpers/hatchery.rb:113:in `block in generations'
      # ./spec/spec_helpers/hatchery.rb:111:in `each'
      # ./spec/spec_helpers/hatchery.rb:111:in `map'
      # ./spec/spec_helpers/hatchery.rb:111:in `generations'
      # ./spec/spec_helpers/hatchery.rb:99:in `great_big_family'
      # ./spec/fam/fam_spec.rb:137:in `block (3 levels) in <top (required)>'
      # ./spec/fam/fam_spec.rb:13:in `block (2 levels) in <top (required)>'

  23) Fam#get_grandparents with greatness 1 should exist
      Failure/Error: Fam::Family::Person.new(name: name)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:115:in `block (2 levels) in generations'
      # ./spec/spec_helpers/hatchery.rb:113:in `each'
      # ./spec/spec_helpers/hatchery.rb:113:in `map'
      # ./spec/spec_helpers/hatchery.rb:113:in `block in generations'
      # ./spec/spec_helpers/hatchery.rb:111:in `each'
      # ./spec/spec_helpers/hatchery.rb:111:in `map'
      # ./spec/spec_helpers/hatchery.rb:111:in `generations'
      # ./spec/spec_helpers/hatchery.rb:99:in `great_big_family'
      # ./spec/fam/fam_spec.rb:137:in `block (3 levels) in <top (required)>'
      # ./spec/fam/fam_spec.rb:13:in `block (2 levels) in <top (required)>'

  24) Fam#get_grandparents with greatness 1 returns each great-grandparent name on a line
      Failure/Error: Fam::Family::Person.new(name: name)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:115:in `block (2 levels) in generations'
      # ./spec/spec_helpers/hatchery.rb:113:in `each'
      # ./spec/spec_helpers/hatchery.rb:113:in `map'
      # ./spec/spec_helpers/hatchery.rb:113:in `block in generations'
      # ./spec/spec_helpers/hatchery.rb:111:in `each'
      # ./spec/spec_helpers/hatchery.rb:111:in `map'
      # ./spec/spec_helpers/hatchery.rb:111:in `generations'
      # ./spec/spec_helpers/hatchery.rb:99:in `great_big_family'
      # ./spec/fam/fam_spec.rb:137:in `block (3 levels) in <top (required)>'
      # ./spec/fam/fam_spec.rb:13:in `block (2 levels) in <top (required)>'

  25) Fam::Family#add_person when the person is new adds a person
      Failure/Error:
        described_class.new(
          people: initial_people,
          relationships: initial_relationships
        )

      ArgumentError:
        wrong number of arguments (given 1, expected 0)
      # ./spec/fam/family_spec.rb:7:in `initialize'
      # ./spec/fam/family_spec.rb:7:in `new'
      # ./spec/fam/family_spec.rb:7:in `block (2 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:17:in `block (3 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:23:in `block (4 levels) in <top (required)>'

  26) Fam::Family#add_person when their name has already been added raises a duplicate person error
      Failure/Error:
        expect { add_person }
          .to raise_error(Fam::Family::Errors::DuplicatePerson)

      NameError:
        uninitialized constant Fam::Family::Errors
        Did you mean?  Errno
      # ./spec/fam/family_spec.rb:34:in `block (4 levels) in <top (required)>'

  27) Fam::Family#add_person adding many people includes them all
      Failure/Error: Fam::Family::Person.new(name: Hatchery::Names.bart)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:52:in `bart'
      # ./spec/spec_helpers/hatchery.rb:44:in `simpsons'
      # ./spec/fam/family_spec.rb:44:in `block (4 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:40:in `block (4 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:47:in `block (4 levels) in <top (required)>'

  28) Fam::Family#add_parent when adding people that are already in the family adds the parent
      Failure/Error: Fam::Family::Person.new(name: Hatchery::Names.bart)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:52:in `bart'
      # ./spec/spec_helpers/hatchery.rb:44:in `simpsons'
      # ./spec/fam/family_spec.rb:67:in `block (4 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:8:in `block (2 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:60:in `block (3 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:72:in `block (4 levels) in <top (required)>'

  29) Fam::Family#add_parent when adding people who are not in the family raises a no such person error
      Failure/Error:
        expect { add_parent }
          .to raise_error(Fam::Family::Errors::NoSuchPerson)

      NameError:
        uninitialized constant Fam::Family::Errors
        Did you mean?  Errno
      # ./spec/fam/family_spec.rb:88:in `block (4 levels) in <top (required)>'

  30) Fam::Family#add_parent when the person already has two parents raises an excess parents error
      Failure/Error:
        expect { add_parent }
          .to raise_error(Fam::Family::Errors::ExcessParents)

      NameError:
        uninitialized constant Fam::Family::Errors
        Did you mean?  Errno
      # ./spec/fam/family_spec.rb:104:in `block (4 levels) in <top (required)>'

  31) Fam::Family#get_grandparents when called without greatness just gets first level grandparents
      Failure/Error: Fam::Family::Person.new(name: name)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:115:in `block (2 levels) in generations'
      # ./spec/spec_helpers/hatchery.rb:113:in `each'
      # ./spec/spec_helpers/hatchery.rb:113:in `map'
      # ./spec/spec_helpers/hatchery.rb:113:in `block in generations'
      # ./spec/spec_helpers/hatchery.rb:111:in `each'
      # ./spec/spec_helpers/hatchery.rb:111:in `map'
      # ./spec/spec_helpers/hatchery.rb:111:in `generations'
      # ./spec/spec_helpers/hatchery.rb:99:in `great_big_family'
      # ./spec/fam/family_spec.rb:111:in `block (3 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:115:in `block (4 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:118:in `block (4 levels) in <top (required)>'

  32) Fam::Family#get_grandparents when called with greatness with greatness 1 skips a generation
      Failure/Error: Fam::Family::Person.new(name: name)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:115:in `block (2 levels) in generations'
      # ./spec/spec_helpers/hatchery.rb:113:in `each'
      # ./spec/spec_helpers/hatchery.rb:113:in `map'
      # ./spec/spec_helpers/hatchery.rb:113:in `block in generations'
      # ./spec/spec_helpers/hatchery.rb:111:in `each'
      # ./spec/spec_helpers/hatchery.rb:111:in `map'
      # ./spec/spec_helpers/hatchery.rb:111:in `generations'
      # ./spec/spec_helpers/hatchery.rb:99:in `great_big_family'
      # ./spec/fam/family_spec.rb:111:in `block (3 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:124:in `block (4 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:131:in `block (5 levels) in <top (required)>'

  33) Fam::Family#get_grandparents when called with greatness with greatness 2 runs out of levels and returns empty
      Failure/Error: Fam::Family::Person.new(name: name)

      NameError:
        uninitialized constant Fam::Family::Person
        Did you mean?  Fam::VERSION
      # ./spec/spec_helpers/hatchery.rb:115:in `block (2 levels) in generations'
      # ./spec/spec_helpers/hatchery.rb:113:in `each'
      # ./spec/spec_helpers/hatchery.rb:113:in `map'
      # ./spec/spec_helpers/hatchery.rb:113:in `block in generations'
      # ./spec/spec_helpers/hatchery.rb:111:in `each'
      # ./spec/spec_helpers/hatchery.rb:111:in `map'
      # ./spec/spec_helpers/hatchery.rb:111:in `generations'
      # ./spec/spec_helpers/hatchery.rb:99:in `great_big_family'
      # ./spec/fam/family_spec.rb:111:in `block (3 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:124:in `block (4 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:139:in `block (5 levels) in <top (required)>'

  34) Fam::Family.from_h 
      Failure/Error:
        described_class.from_h(
          people: [
            {
              name: Hatchery::Names.bart,
            },
            {
              name: Hatchery::Names.homer,
            },
          ],
          relationships: [

      NoMethodError:
        undefined method `from_h' for Fam::Family:Class
      # ./spec/fam/family_spec.rb:147:in `block (3 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:163:in `block (3 levels) in <top (required)>'

  35) Fam::Family.from_h 
      Failure/Error:
        described_class.from_h(
          people: [
            {
              name: Hatchery::Names.bart,
            },
            {
              name: Hatchery::Names.homer,
            },
          ],
          relationships: [

      NoMethodError:
        undefined method `from_h' for Fam::Family:Class
      # ./spec/fam/family_spec.rb:147:in `block (3 levels) in <top (required)>'
      # ./spec/fam/family_spec.rb:164:in `block (3 levels) in <top (required)>'

Finished in 9.15 seconds (files took 0.39455 seconds to load)
41 examples, 35 failures

Failed examples:

rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:1:1:1] # Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:1:1:2] # Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:2:1:1] # Fam::CLI::Add::Parents when all names are missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:2:1:2] # Fam::CLI::Add::Parents when all names are missing behaves like a failed command matches the expected error
rspec ./spec/boilerplate/cli/add/person_spec.rb[1:1:1:1] # Fam::CLI::Add::Person when a name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/add/person_spec.rb[1:1:1:2] # Fam::CLI::Add::Person when a name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:1:1:1] # Fam::CLI::Get::Parents when a child name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:1:1:2] # Fam::CLI::Get::Parents when a child name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:2:1:1] # Fam::CLI::Get::Parents when the child name is missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:2:1:2] # Fam::CLI::Get::Parents when the child name is missing behaves like a failed command matches the expected error
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:1:1:1] # Fam::CLI::Get::Person when a name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:1:1:2] # Fam::CLI::Get::Person when a name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:2:1:1] # Fam::CLI::Get::Person when the name is missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:2:1:2] # Fam::CLI::Get::Person when the name is missing behaves like a failed command matches the expected error
rspec ./spec/fam/fam_spec.rb:31 # Fam#add_person should be success
rspec ./spec/fam/fam_spec.rb:33 # Fam#add_person writes the person name to the output file
rspec ./spec/fam/fam_spec.rb:69 # Fam#add_parents should be success
rspec ./spec/fam/fam_spec.rb:71 # Fam#add_parents writes the new relationship to the output file
rspec ./spec/fam/fam_spec.rb:120 # Fam#get_parents should be success
rspec ./spec/fam/fam_spec.rb:122 # Fam#get_parents returns each parent name on a line
rspec ./spec/fam/fam_spec.rb:144 # Fam#get_grandparents with greatness 0 should exist
rspec ./spec/fam/fam_spec.rb:146 # Fam#get_grandparents with greatness 0 returns each grandparent name on a line
rspec ./spec/fam/fam_spec.rb:155 # Fam#get_grandparents with greatness 1 should exist
rspec ./spec/fam/fam_spec.rb:157 # Fam#get_grandparents with greatness 1 returns each great-grandparent name on a line
rspec ./spec/fam/family_spec.rb:22 # Fam::Family#add_person when the person is new adds a person
rspec ./spec/fam/family_spec.rb:32 # Fam::Family#add_person when their name has already been added raises a duplicate person error
rspec ./spec/fam/family_spec.rb:46 # Fam::Family#add_person adding many people includes them all
rspec ./spec/fam/family_spec.rb:71 # Fam::Family#add_parent when adding people that are already in the family adds the parent
rspec ./spec/fam/family_spec.rb:86 # Fam::Family#add_parent when adding people who are not in the family raises a no such person error
rspec ./spec/fam/family_spec.rb:102 # Fam::Family#add_parent when the person already has two parents raises an excess parents error
rspec ./spec/fam/family_spec.rb:117 # Fam::Family#get_grandparents when called without greatness just gets first level grandparents
rspec ./spec/fam/family_spec.rb:130 # Fam::Family#get_grandparents when called with greatness with greatness 1 skips a generation
rspec ./spec/fam/family_spec.rb:138 # Fam::Family#get_grandparents when called with greatness with greatness 2 runs out of levels and returns empty
rspec ./spec/fam/family_spec.rb:163 # Fam::Family.from_h 
rspec ./spec/fam/family_spec.rb:164 # Fam::Family.from_h 

```

