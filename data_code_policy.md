# SFIM data & software policy  

The end goal of this policy is for someone who wasn’t directly involved in a study to know:

- What the data are
- How they are organized
- What the code is expected to do

## Data management

- The acquired data (MRI, EEG, physiological monitoring, behavioral responses, etc.) from every study should be logged in a way so that others can figure out which datasets were used in each study.

- If an experimental design was used (e.g., task), a detailed description of the timing and events must be provided so that others could potentially reproduce the paradigm and the statistical analysis (e.g., produce activation maps).

- To make internal sharing possible, place unprocessed data in an accessible (i.e. biowulf) study-specific location.

- Clearly document which datasets and runs are used in a study and, if there are problematic runs (volunteer behavior or acquisition problems), clearly document how/why.

## Processing and electronic lab notebooks

- Keep all processing scripts that might be used for a publication in a version-controlled github repository.

- Each repository should have some type of readme file to orient the creator’s future self and others. At a minimum it should include information about what each script does, and the order in which those scripts are expected to be executed. Documentation should include the objectives and reasoning of the step, not just what is done.

- It should be possible to understand the steps used to process the data, even if someone cannot just re-run scripts (i.e. saying, “This is the point where ROIs were hand-drawn” or “visual inspection of data used to remove bad runs”, is fine but that should be clear)

## To make sure these end goals are achieved, every SFIM study should do the following

- When a study is in the planning stage, decide what data/information should be stored.

- By the time one starts to acquire/download data and write scripts, there should be a data/script organization plan for the study. This plan will include when and how data will be de-identified and should be made in consultation with a staff scientist to make sure relevant data are identified, and a scientific programmer or staff scientist to make sure the relevant data are logged in an appropriate manner.

- Before the study starts in earnest, work with a scientific programmer or staff scientist to begin the codebase and structure it. Identify parts of the codebase that would benefit from direct programming by scientific programmer rather than by scientists or trainees.

- Initially, on a monthly basis, review code with a scientific programmer. On a similar timetable, review data with a staff scientist and scientific programmer (staff scientist for expertise, programmer for compliance with any data standards). Adjust frequency as needed.

- Prior to manuscript submission, have another review session with a scientific programmer to start discussing future steps regarding repo/data organization and archiving. If the plan is to make some or all of the data and analyses publicly available, identify gaps that should be addressed by the researchers, a scientific programmer, or DSST.
