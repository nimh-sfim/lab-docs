# How To: Start a Study

Here, we give a broad overview on how to start a study.

1. *Identify or request space on Biowulf to store data and code*

    Data and code should be stored on Biowulf, rather than your local laptop. In consulting with staff scientists or scientific programmers, if there is not already logical location to store and process a study's data, put in a request to the HPC team for a new directory. Make sure that it's name begins with "SFIM_" and ends with something descriptive. Ensure that Staff Scientists and the Scientific Programmer, in addition to any other SFIM collaborators who are working on the project have access to this directory.

1. *Set up your codebase*

    Once you have a dedicated space on Biowulf, start setting up your codebase. We recommend setting up your code base like the example below to faciliate sharing of processing scripts across the lab.

    ```bash
    SFIM_temp
    ├── Behavioral
    ├── PrcsData
    │   └── SBJ01
    │       ├── D00_OriginalData
    │       ├── D01_Anatomical
    │       └── D02_Preprocessing
    ├── RawData
    │   └── yyyy_mm_dd
    │       └── SBJ01
    ├── Results
    └── Scripts
    ```

    - `Scripts` : contains all processing scripts, and should be tracked using Git and GitHub. Please see the [How to: Set up and use a GitHub repo][use_github] for how to set up a GitHub repo for your project.
    - `RawData` : DICOM files, unprocessed behavioral files, unprocessed physiological files, and any other data acquired at the scanner in raw format
    - `PrcsData` will be where all processed data will reside. In general, there will be a subdirectory per subject. At a minimum, this directory should include subdirectories:
        - `D00_OriginalData` : unprocessed AFNI files for all scans of interest (after transforming and de-identifying the DICOM files)
        - `D01_Anatomical` : unprocessed and processed anatomical data
        - `D02_Preprocessing` : outcomes of most pre-processing steps
    - `Behavioral` will include results for behavioral analysis, if that is part of your project.
    - `Results` : results such as figures, graphs, etc

    You can also meet with a Staff Scientist or the Scientific Programmer to plan out what your codebase should look like.

1. *Collect your data*

    This can look different depending on whether you're working on an acquisition or analysis-based study.

    If you're working on an acquisition based study, you will want to collaborate with SFIM staff scientists and the FMRIF Core to optimize existing or develop new sequences. Especially during early stages, make sure you look at your data as you collect it. The AFNI team has worked on some cool tools for [quality control][afni_qc] to help you explore your data and make sure everything is working as you expect it to.

    If you're working on an analysis-based study using data we already have on Biowulf (or if it's a dataset curated by DSST), you can just get started on your analyses.

    For studies with new and existing data, [The art and science of using quality control to understand and improve fMRI data][qc_article] is a good review article that provides an overview of things to consider when designing a study and processing data. The appendix includes a checklist of questions and topics to answer when planning a study.

1. *Get your data and code ready for sharing*

    Once you've finished your analyses and written up a manuscript, get ready to share your data. Check out our Data and Code policy and the [How to: Get your data and code ready for publication][share_data_code] for details.

[use_github]:<github.md>
[afni_qc]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/apqc_html/main_toc.html
[qc_article]: https://doi.org/10.3389/fnins.2023.1100544
[share_data_code]:<ready_for_pub.md>
