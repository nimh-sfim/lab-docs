# How to: Get started with AFNI

[AFNI][afni_main] (**A**nalysis of **F**unctional **N**euro**I**mages) is a software suite developed by the Statistical and Scientific Computing Core at the NIMH. It is freely available and can be run on MacOS and Linux systems. Given its flexibility, utility, amazing color scheme, and the fact that the developers are right down the hall, many members of SFIM opt to use AFNI to analyze their fMRI data. This page has instructions on how to get AFNI set up on your laptop and some helpful tips and tricks for using it.

## Installing AFNI

Because you will not have admin priviledges on your laptop when you first get it, the first step is to install the AFNI dependencies via the NIMH Self-Service portal. This will require your PIV card.

After that, you can use the following commands to get a download script:

```bash
cd
curl -O https://raw.githubusercontent.com/afni/afni/master/src/other_builds/OS_notes.macos_12_ARM_b_user.tcsh
```

Then, you can use the following command to install AFNI:

```tcsh
tcsh OS_notes.macos_12_ARM_b_user.tcsh
```

For additional details, the AFNI team has put together a page with [instructions][afni_install]. You may wish to follow the instructions on how to set up for AFNI Bootcamp.

## Learning to use AFNI

AFNI is fast, powerful, and flexible. It was designed from the beginning ot [keep users close to their data]. The flip side of this is that there's always more to learn and it can be a bit overwhelmin to someone who is new to fMRI data analysis. It takes time and practice to learn, but because it can keep you close to your data, you'll have the opportunity to really understand what is happening during data processing.

At least once a year, the AFNI team puts on AFNI Bootcamp. This is a week long immersive course where you can learn all about how to use AFNI, and we recommend attending when it comes around. The AFNI team also put together [AFNI Academy on Youtube][afni_academy], which is basically an expanded version of the Bootcamp lectures, which you can watch to learn more about what you can do in AFNI at your own pace. You will learn a lot if you attend the bootcamp knowing nothing about AFNI, but you'll learn more if you've been using AFNI for a few months, watch some of the videos, had have a rough idea of what's possible in AFNI.

If you're a person who prefers to read tutorials rather than watch videos, you can also look at the [handouts from AFNI Bootcamp][bootcamp_handouts], follow the many [AFNI tutorials][afni_tutorials], or [check out publications][afni_codex] that have used AFNI for their analyses. If you have specific questions that aren't covered in any of the above resources, you can check out the [AFNI Message Board][AFNI_message_board] to see if anyone has had similar issues. If you want to stray from the offical AFNI material, you can also check out the [AFNI section in Andy's Brain Book][afni_abb].

### Common Tasks

Below are links to some tutorials and documentation that you might find useful as you use AFNI.

- [Use the GUI][afni_gui]
- [Use afni_proc.py][afni_proc_doc]
- [Anonymize Data][anonymize_data]
- [Do QC][afni_qc]
- [Using AFNI with Freesurfer][afni_freesurfer]
- [Working with ROIS][afni_ROIs]
- Analyzing [task][afni_task_teams] and [rest][afni_rest_teams] data (Note: these are stored on our internal Teams channel)
- [Work with Layers][afni_layers]

## Help, I'm still confused

For as much as we love AFNI, there can be a steep learning curve for it, especially if you have limited experience working on the command line, don't know a ton about fMRI, haven't encountered much applied statistics, or any combination of the above. To that end, here are some more basic resources to help you get familizarized with using AFNI.

- [AFNI for Absolute Beginners][afni_beginners]
- [Glossary of AFNI terms][afni_glossary]
- [Common AFNI Programs, explained][common_afni_progs] **Note:** this was created in 2014 and is due for a major overhaul but it still has some useful big-picture information
  - A more complete and up-to-date list of all the AFNI commands and their help pages can be found on the [classifed program list][afni_prog_list]

[afni_main]: https://afni.nimh.nih.gov
[afni_install]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/steps_macOS_12_Silicon.html#quick-setup-special-case-nimh-administered-computers
[afni_academy]: https://www.youtube.com/channel/UC40RiNZN7_dCuB6Lg7HJl1g
[bootcamp_handouts]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/educational/handouts.html
[afni_tutorials]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/main_toc.html
[afni_codex]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/codex/main_toc.html
[afni_message_board]: https://discuss.afni.nimh.nih.gov
[afni_abb]: https://andysbrainbook.readthedocs.io/en/latest/AFNI/AFNI_Overview.html
[afni_prog_list]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/programs/classified_progs.html#edu-class-prog
[afni_gui]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/afniandafni/gui_guide/main_toc.html
[afni_proc_doc]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/programs/alpha/afni_proc.py_sphx.html#ahelp-afni-proc-py
[anonymize_data]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/refacer/refacer_run.html
[afni_qc]:https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/apqc_html/main_toc.html
[afni_freesurfer]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/fs/fs_fsprep.html#tut-fs-fsprep
[afni_ROIs]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/rois_corr_vis/cat_netcorr.html
[afni_layers]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/tutorials/surflayers/surflayers.html
[afni_task_teams]: https://nih.sharepoint.com/:w:/r/sites/NIMH-SFIM/Shared%20Documents/Tutorials/SFIM_Tutorial_01_TaskData.docx?d=w3f37284d446246989b3dcd06ce3d4c6f&csf=1&web=1&e=1HmtjE
[afni_rest_teams]: https://nih.sharepoint.com/:w:/r/sites/NIMH-SFIM/Shared%20Documents/Tutorials/SFIM_Tutorial_02_RestData.docx?d=w3de2a412cf46460cb40d5d0c23a46dd0&csf=1&web=1&e=9dVUdO
[afni_beginners]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/afniandafni/gui_readme_tips.html#afni-for-absolute-beginners
[afni_glossary]: <afni_info/afni_glossary.md>
[common_afni_progs]: <afni_info/common_afni_programs.md>
