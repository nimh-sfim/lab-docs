# How To: Start a Study

Here, we give a broad overview on how to start a study.

1. *Request space on Biowulf to store data and code*

    Data and code should be stored on Biowulf, rather than your local laptop. To keep things organized, put in a request to the HPC team for a new directory. Make sure that it's name begins with "SFIM_" and ends with something descriptive. Ensure that Staff Scientists and the Scientific Programmer, in addition to any other SFIM collaborators who are working on the project have access to this directory.

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

    If you're working on an acquisition based study, you will want to collaborate with the FMRIF Core to develop sequences.

    As you're acquiring data, you should make sure to record the following information:

    - Date and time of scan
    - Scan number
    - Age and gender of subject
    - Phantom, if applicable
    - One entry for each applicable scan (even if scan failed). Make sure to note if the scan crashes or was manually stopped, any artifacts were seen, or if patient said they moved, fell asleep, had trouble with task, etc.
    - After the scan, make sure to add in successful scans nubers' as they are listed for DICOM and Realtime on the FMRIF website

    Do **NOT** include subject's name or DOB, or add the RIS sticker (or any other PII) if you are scanning and saving the information.

    If you are piloting or working with the first few subjects in a new study, be sure to take note of scan parameters (TR, FOV, FatSat?, # Measurements, Y/N Physio, etc) and details on the task paradigm

     If you're working on an analysis-based study using data we already have on Biowulf (or if it's a dataset curated by DSST), you can just get started on your analyses.

1. *Analyze your data*

    This will be project specific, but we have a few general recommendations:

    - Especially during early stages, make sure you look at your data as you collect it. The AFNI team has worked on some cool tools for [quality control][afni_qc] to help you explore your data and make sure everything is working as you expect it to.
    - If you are new to analyzing fMRI data, we have tutorials for analyzing [task][task_data_tutorial] and [rest][rest_data_tutorial] data in our internal Teams channel.
    - The wonderful AFNI group has also created a number of [tutorials][afni_tutorials] for analyzing data.

    If you need additional resources, check out our [Education][education] page.

1. *Get your data and code ready for sharing*

    Once you've finished your analyses and written up a manuscript, get ready to share your data. Check out our Data and Code policy and the [How to: Get your data and code ready for publication][share_data_code] for details.

[use_github]:<github.md>
[afni_qc]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/apqc_html/main_toc.html
[task_data_tutorial]: https://nih.sharepoint.com/:w:/r/sites/NIMH-SFIM/Shared%20Documents/Tutorials/SFIM_Tutorial_01_TaskData.docx?d=w3f37284d446246989b3dcd06ce3d4c6f&csf=1&web=1&e=1HmtjE
[rest_data_tutorial]: https://nih.sharepoint.com/:w:/r/sites/NIMH-SFIM/Shared%20Documents/Tutorials/SFIM_Tutorial_02_RestData.docx?d=w3de2a412cf46460cb40d5d0c23a46dd0&csf=1&web=1&e=9dVUdO
[afni_tutorials]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/main_toc.html#
[education]: <education.md>
[share_data_code]:<ready_for_pub.md>
