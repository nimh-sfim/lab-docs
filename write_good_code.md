# How to: Write good code

As a part of our work, we have to write a lot of code. It makes everyone's life easier (including your own!) if you put effort into writing good, readable, well-commented code. On this page, we have some tips for how to go about doing that.

Writing good code is not specific to any single language. If you already have preferences on what coding language you want to work in, awesome! If you don't, we tend to like Python - it's open source and has a wide ecosystem of tools for data science, machine learning and neuroimaging. What language you ultimately decide on will depend on what you need to do and your collaborators. Check out our [Education page][education] for plenty of resources on programming in general.

- [Style](#style)
- [Approach](#approach)
- [Code Review](#code-review)

## Style

It makes life easier to review code across people if we follow a consistent coding style. Please use the following resources for Python style guides:

- [PEP8, the style guide for Python code][pep8]
- [Numpy docstring standard][numpydoc]

If you want to use a built-in style checker, you can use [flake8][flake8]. If you use VSCode as your IDE, there is an [extension][flake8_vscode] for flake8 that you can download.

## Approach

We recommend the following approach to programming:

1. [Specify the Problem](#specify-the-problem)
1. [Create Documentation and Tests](#create-documentation-and-tests)
1. [Implement the Solution](#implement-the-solution)
1. [Iterate in Order](#iterate-in-order)

### Specify the Problem

First, you will need to specify the problem.
For a small shell script, this may be as simple as

```
Run this other script for each directory.
```

where the other script is more complex.
The specification for the other script may be

```
Run the following analysis steps:
   1. De-identify data
   2. Preprocess data
   3. Analyze with step A
   4. Analyze with step B
   ...
```

and so on.
For simple scripts and one-off, just specify enough detail so that you and
your collaborators are on the same page.
You can specify the details either in an email, or in a file in a
repository, or if the project is small enough, as a comment at the top of a
shell script.
However, it is essential that you make sure there is enough detail to
implement a solution that everyone can agree "works."
If you have no idea whether a given solution would be successful or not,
you should add more detail.

In very complex projects, such as large software projects, specifications
may become quite large.
As an example, during a real-time EEG-guided clinical trial, a
specification created was 50 pages long, with details on the user interface
and safe failure modes.
Most of the time this won't be required, but in cases where it is, consider
using a large document in the repository.

### Create Documentation and Tests

Once there is an agreed-upon specification, you should create documentation
and (where possible) tests.

Documentation should be created for both the user and the developer(s).
Start with user documentation.
That way, if you realize it's hard to explain how to use something, you can
revise the specification so that your software will be more user-friendly.
Developer documentation should also have relatively simple explanations for
how to use your modules/scripts and things to consider while changing code.
For small scripts, this documentation could be as simple as labeling what
arguments are being passed in and noting some software requirements.
For larger projects, consider creating a full documentation setup with a
service such as [readthedocs][rtd].

For shell scripts, tests are difficult to create and most likely will need
to be done manually.
However, you can devise a set of tests to be run manually to check that
your shell script is working and write them down somewhere.
In languages such as Python, MATLAB, and C++, there are various testing
facilities available.
When starting a project in one of those languages or environments, you
should familiarize yourself with the testing procedure.
Create tests which verify that your future code will match the
specification.

### Implement the Solution

With specification, documentation, and tests in hand, you should then
implement your solution.
Make sure that the tests and documentation match your implementation.
Whenever there is a mismatch, you should assume the implementation is
incorrect rather than the documentation or tests, until proven otherwise.
This is why we create documentation and tests first: they are designed to
match our specification, and that is your guiding document.
If you decide that the documentation or tests are out of alignment with the
specification, adjust those first.
If you decide that the specification is incorrect, amend it to what you
believe is correct, then your documentation and tests, then your
implementation to match.

### Iterate In Order

Once you have an implementation which matches the specification and tests,
you should change things in the same order if you decide to make revisions:

1. Modify the specification.
1. Adjust documentation and tests.
1. Adjust the implementation.
The reason for doing this is that often it's easy to forget to go back and
adjust your documentation and tests once you have a solution.
It's much harder to forget to adjust your implementation when the software
isn't behaving the way you want it to!

## Code Review

A particularly useful way to learn how to write good code is to have others look at your code and tell you how you can improve. This isn't just style - sometimes it helps to have another brain help work through a problem in a new and creative way.

In general, a high-quality code review in SFIM should be:

1. Constructive: remember the human you are reviewing and treat them withprofessionalism and respect.
   It is an opportunity for the reviewee to learn more, and for the
   reviewer to learn to communicate their ideas clearly.
1. Clear and Actionable: whomever you're reviewing should be able to act
   independently with your review in hand.
   Reviews should make it clear what an approvable implementation would
   consist of if the reviewer requests changes.
   Reviews should only contain actionable items, and avoid values
   judgements such as "this is bad."
1. Enforcing Consistency: Reviews should ensure that lab code has a
   consistent style and logic, which enhances future legibility and
   reproducibility across different projects and even by other labs.
1. Skill Level Appropriate: There is a range of skillsets in the lab.
   Please make sure that your review is actionable (See point 2) for
   someone of the skillset you're reviewing.
   You cannot expect a novice programmer to write highly complex
   implementations without large amounts of guidance or perfect style.
   If the code requires a large amount of review or interference,
   consider co-programming.

If you want to learn more about code review, check out the [MIT Reading on Code Review][mit_read] (the exercises use Java language but
the general principles and tips are still useful).

[education]:education.md
[pep8]: <https://www.python.org/dev/peps/pep-0008/>
[numpydoc]: <https://numpydoc.readthedocs.io/en/latest/format.html#docstring-standard>
[flake8]: <https://flake8.pycqa.org/en/latest/>
[flake8_vscode]: https://marketplace.visualstudio.com/items?itemName=ms-python.flake8
[rtd]: https://readthedocs.org
[mit_read]: <https://web.mit.edu/6.005/www/fa15/classes/04-code-review/>
