# How to: Get your data and code ready for publication

We are required to publicly share our data and code for every paper we publish. For the big picture on what this looks like, check out the lab [Data and Code Policy][data_code_policy]. Because this can look slightly different for every study, this page won't go over the nitty gritty details, but rather give an oveview of the things that need to happen to get data and code ready for publication.

## Sharing data

If you have collected data, ensure it is ready to be shared in the appropriate repository - note that many repositories require neuroimaging data to be in [BIDS format][bids]. Data should be de-identified of any PII (including any session data/time information) and clearly organized. You should be prepared to share the raw data, the final derivatives that you performed your analyses on, and the code used to produce the final derivatives (i.e. you don't have to share all the internal pre-processing steps that AFNI produces, but you should share any timeseries that you extract from resting state that you do later analyses on). You should also make sure that any notes about what data are used in the analyses, and if there were any problematic runs/subjects. If you need support on getting data ready for sharing team, you can reach out to the [DSST][dsst].

## Sharing Code

As outlined in the Data and Code Policy, publicly available code should be make it clear what analyses were run, how to run them and how to reproduce the results reported in the paper. This documentation should also include information about your programming environment (dependencies and package versions) and details about experimental procedure (i.e. PsychoPy scripts and a description of the task/stimuli).For a good example of what this might look like, check out the [ComplexMultiEcho][complex_multi_echo] or [rtPupilPhase][rtPupilPhase] repositories.

Code itself should also be well-commented and easily understood (check out the [How to: Write Good Code][write_good_code] page for how you might do that). You want someone (whether that's a reviewer or yourself in a few months) to be able to understand what you were doing and why. That can look like in-line comments describing the purpose of what you wrote or markdown text blocks in Jupyter Notebooks, or a combination of the two.

Finally, published code should not be broken - if a reviewer clones your repo, they should be able to run your analyses from start to finish without encountering any errors. As a test, you can try downloading a clean copy of your code from the repo and see if it works. Common culprits to check for are file paths and package imports. If you're working in Jupyter notebooks, you also may want to make sure that everything still works if you clear the environment and run all the cells in sequence.

If you haven't already been working with staff scientists or the Scientific Programmer throughout the process of collecting and analyzing data (which we *strongly* recommend you do), reach out to them to ensure that everything is in order.

[data_code_policy]:<data_code_policy.md>
[bids]: https://bids.neuroimaging.io/
[dsst]:https://cmn.nimh.nih.gov/dsst
[complex_multi_echo]:https://github.com/nimh-sfim/ComplexMultiEcho1
[rtPupilPhase]:https://github.com/nimh-sfim/rtPupilPhase
[write_good_code]: <write_good_code.md>
