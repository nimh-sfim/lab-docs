# Most commonly used AFNI programs

[Detailed information about all AFNI command line programs][prog_list] can be found within the AFNI website. The descriptions below are meant to be used as an introductory text. You will learn all the details of each program as you work on specific projects, as many of them have a substantial number of options and ways in which they can be run. You will usually have a BASH/Python based script that will call some or all of the programs listed below in order to pre-process and analyze the data for a given project. Which programs you use and in which order will depend on things such as: (1) is this task-based or resting-state data; (2) do you have respiratory and cardiac data available, (3) experimental question, etc.

Before we get too far, note that this list of programs may be outdated, as it was written in 2014 and is well overdue for a major update. It still has some useful content, but be sure to reference AFNI documentation for new(er) tools and best practices.

## General Purpose Programs

**3dcopy & 3drename**
These commands are similar to bash’s cp and mv, respectively, with an important difference.  In AFNI, you are working with .HEAD and .BRIK files.  You can think of the .HEAD files as the one that stores the metadata, i.e., descriptive information, while the .BRIK files give the image data (with at least 3 spatial dimensions).  We always want the link between these file pairs to remain intact.  Therefore, when we copy, rename, or move one of these files, we want to make sure we do the same with its “sibling” file.  All AFNI programs will do their best to maintain this link.  When you are doing simple file organization, you want to use these commands, rather than the equivalent bash commands.  

**3dinfo**
This is one of the simplest, yet most useful programs in AFNI.  Essentially, it makes info in the .HEAD file readable.  If you just do “3dinfo [filename],” a long list of information will be printed to the screen. This can be a helpful thing to run to 1) get an idea of the information available, 2) quickly grab info once you become familiar with the output format, and 3) see the history of commands that led up to the creation of that file.  Moreover, we use this command for extraction of specific information in our analysis scripts.  For example, we might want to make sure all the data we are processing have the same TR. We might set a variable to “3dinfo –tr [filename],” and check this against an expected TR value.  Valuable information includes number of slices, slice timing, grid spacing, space (e.g. +orig vs +tlrc), tr, number of time points, etc.

**3dcalc**
This program is a really useful tool to perform simple/straightforward mathematical calculations on your data. The form it takes is usually `3dcalc –a [filenameA] –b [filenameB] –expr ‘(the mathematical expression you want to perform on data “a” and “b”)‘`  
One example of how you might use this would be to subtract one activation map from another activation map, to look at differences between task conditions (e.g., where activates more with a flashing checkerboard vs. flashing faces?). Another example would be if you had a mask, you could zero out any areas in your data that do no fall within that mask.  
While `3dcalc` is straightforward, it is not optimized for some calculations.  So, for example, if you want to take the voxel-wise average of 2 datasets, it would be faster to run an optimized program like `3dMean`, rather than `3dcalc`.

**3dbucket**
There will be times when you’ll want to rearrange sub-bricks in or across a brick file. If you are working with 4D functional data, you might want to a) remove the first 10 seconds of data, b) look at the first half and second half of a run separately, c) only look at every other data point, d) concatenate several runs, and so on… This program allows for easy manipulation of the order of your sub-bricks.  
Sometimes your sub-bricks are not time points.  For example, your first sub-brick might be an activation map, the second sub-brick is some statistical map, and the third sub-brick is a mask.  This is a completely valid way of organizing your data, and 3dbucket is a useful way to shuffle these sub-bricks.  Just keep in mind that the 4D structure you have here is quite different from the 4D structure you have in the functional data example above.  

**3drefit**
In some cases, the information in the .HEAD file is incorrect or incomplete.  To make the appropriate changes, use 3drefit. An example of when this would be used is if you switched from +orig to +tlrc, and that has not been updated in the .HEAD file, or if you were anonymizing data and needed to remove PII.

**3dresample**
Similarly to `3drefit`, `3dresample` helps you “fix” your dataset.  A typical example of this might be when you have data in the same location (sitting on top of each other), but in a different grid. This program allows you to resample one of the datasets using the grid of the other datasets, so that any operation you do after that (e.g., with 3dcalc) is done on each voxel appropriately.

**1dplot**
This is a great tool for quickly looking at .1D files without having to open AFNI.  Common .1D files would be 1) timeseries for a voxel or ROI, 2) physio data (cardiac or respiratory), 3) motion timeseries, and 4) model shapes (like task timing convolved with the hemodynamic response function).  

## Pre-processing Programs

The first step we typically take in preprocessing is removing the first 10 seconds (or whatever other amount of time you choose) of data from the scanner (especially if dummy scans were not collected).  The reason for this is because the magnet has not yet reached “steady-state.”  When the scanner is not collecting data, the signal is completely “relaxed.”  When the first RF pulse is triggered, the magnetization vector is tipped, and “slowly” returns to its relaxed position.  However, the next RF pulse is sent before the scanner is fully relaxed.  It takes several RF pulses for the scanner to get to a stable range of relative “relaxed position” vs max post-RF position.  You can use several programs to remove these early volumes, i.e., `3dcalc` or `3dbucket`.  

**3dTshift & 3dTRfix**
Next, we have to correct for the fact that, in a given volume, the slices are collected at different times.  These differences are on the scale of ms, but they are important to correct for.  When using `3dTRfix`, you generally use the first slice as your reference volume.  Then you pretend that all the slices were collected when that first slice was collected and interpolate to corrected values.
`3dTRfix` is for when you have a special case of data, where the timing between measurements are not equal. This might be the case for data with cardiac gating, for example. This can make data analysis tricky.  So, what this function does is not only interpolate the slice timing to zero, but also interpolates the volumes to a set TR value.  

**3dDespike**
Sometimes there are points in the data were the signal change is too large to be anything other than noise.  In these cases, we know that we should truncate the signals.  AFNI uses a model to decide how much to truncate these large peaks.  However, if you lay your post-despike data over your pre-despike data, you can clearly see where the corrections are made.  

**3dDetrend**
It is not unusual to see that the timeseries for a voxel might have a slow general increase or decrease over the course of a scan.  This is generally a signal of no interest (some exception may apply).  You may choose to remove this “average drift” with `3dDetrend`.

**3dBandpass**
There may be frequencies in our data that we know cannot be BOLD activation.  In these cases, we remove these frequencies with `3dBandpass`.  The typical range of frequencies we keep are 0.01 Hz to the Nyquist frequency.

**3dSkullStrip**
We are interested in the brain, not the skull.  This program is an automated way of removing the majority of the skull in our anatomical data.  

**3dAutoMask**
Similarly to `3dSkullStrip`, we want to look at the brain, not the fluid/tissue around it.  This program removes that (after you’ve run `3dSkullStrip`).  Keep in mind, there may be small errors in the output.  It is usually a good idea to go into your anatomical data and manually correct the remaining errors.  

**3dMerge & 3dBlurInMask**
In fMRI, we want to perform some “smoothing.”  Because the brain is known to have properties of localized function, we know that if one voxel is active, it is likelier that its neighbor voxel is also active.  Becuase of this inherent smoothness in the data, bluring is commonly done during pre-processing to reduce thermal noise and also to help better combine results across subjects.  This is commonly done with a Gaussian kernel, where you set the full-width half-max.  Therefore, if you set the FWHM to 6, the six closest voxels will be averaged together, with the farther ones weighted lower.  You can add subtleties to your blurring.  For example, you could use `3dBlurInMask` to blur only the gray matter.  This may remove partial volume effects with white matter, but could cause other problems.

### Aligment Programs (part of Pre-processing)

You’ll need a make a decision of what “space” you would like to work with.  When you collect data, anatomical data and functional data are each in their own “+orig” space.  This space depends on the center, resolution, angle of acquisition, among other things.  Since these are prescribed differently at the scanner, it means that even though you have the same brain in both cases, and that they might obviously correspond to each other by eye when you look at them separately, there is noreason to believe that they actually in exactly the same position (sitting on top of each other).

Another issue may be that you have several subjects and you want to align them together.  Similarly, you need to tell AFNI how to overlap them.  (In my experience, this “group space” is the least common, particularly given the next option…).

Finally, there are template spaces that fMRI researchers use.  The most frequently one used is MNI, with Talairach being second.  The Talairach brain was a carefully acquired post-mortem brain.  While good in one sense, since dead brains move less, you also only have one brain to base it off, and the brain of someone dead isn’t quite like the brain of someone else.  The legacy lives on though, which is why AFNI uses “+tlrc” to mean template space.  The MNI brain, instead, is the average of over a hundred brain.  Additionally, the MNI group has the Colin27 template, where one lab member was scanned 27 times.  The Colin27 brain therefore has more detail (crisper image), but too much specificity for some uses.  We typically use the MNI template.  This is fortunate because MRI anatomists map with MNI coordinates, which means we can ask for x,y,z, coordinates and find a corresponding part of the brain.  (See Neurosynth)

So now, what do we actually want to do with these different spaces?  The most straightforward approach, and the one commonly used when you want to study individual subject results, is to align the fMRI data to the anatomical data. This is useful because you can look at the timeseries collected, and where on the higher res image that timeseries falls.  One option then would be to further align the anatomical to MNI as well.

The more frequent approach, in my experience, is to align the anatomical and functional data to the MNI space.  The reasons for this are pretty straightforward; MNI is a standard.  That means when other people are looking at your data, they have a greater familiarity with the underlying anatomical image.  Also, if you want to, say, find the auditory cortex, you do a quick literature search to find the MNI coordinates, plug them into AFNI, and you will be brought to that area.  Also, when you are getting group results, it could be challenging to decide how to best present the data, so putting it on a template is useful.

So how do we actually do this?  In practice, we generally first align the functional to the anatomical, the anatomical to MNI, and then the aligned functional to MNI (which will now be the same transform as from anatomical to MNI).  It is common practice to compute each spatial transformation separately, then combine them in an overall transformation, and finally use that overall transformation in a single alignment step (so that spatial interpolation only happens once). Here are the AFNI programs we use to do this:

**3dvolreg**
This alignment program does some cleanup.  Namely, if the subject moves his/her head throughout the scan, then you need to align all the volumes to some reference volume. A useful output of this program is how much of a correction it has to make with each volume.  In other words, it tells you when the subject moved, and how much they moved. After using this program we tend to say that the data has been motion-corrected. That doesn't mean though that all motion artifacts are removed. If motion was too big, even after using this program your data will contain artifacts due to motion. It is not uncommon in fMRI to discard data when excessive motion exists.

**3dAllineate & 3dQwarp**
`3dAllineate` aligns one dataset (e.g., functional) to another (e.g., anatomical), and allows for a number of different alignment methods.  If you are having trouble with alignment AND you have a ton of time, you can try `3dQwarp`.  This program does the non-linear version of the alignment.  It takes forever, so it isn’t always used.

**align_epi_anat.py**
This AFNI program is sort of the newer version `3dVolreg` and `3dAllineate` combined.  Basically, if you want to do standard alignment, this will give you all need. In fact, it uses these other programs internally. Additionally, it gives matrix outputs of the alignments, which you could use in conjunction with `3dAllineate` if the need arises.

## Analysis-like Programs (I)

At this point, you have done 2 important things with your data.  First, you have pre-processed it.  This cleans the data and removes some noise.  Then you have aligned your data, so now your anatomical and functional data are in the same space (and that may be template space).  

Remember, your anatomical images are 3D (3 spatial dimensions) and your functional images are 4D (3 spatial and 1 temporal dimension).  While you can “watch” the functional data (e.g., you can watch how BOLD signal changes over time), we need to quantify what we see in these movies.  Maybe more importantly, because of its 4D nature, we can’t look at all the data all at once, so we want to perform statistics on our data that 1) summarize these movies and 2) point out phenomena that can only be seen by looking at data in a static form.  

**3dMean**
This is a straightforward program.  The exact same thing could be done with `3dcalc`, though this is optimized to run faster.  It takes the average of two (or more) functional datasets.  This can either be several runs from the same subject, runs from several subjects, or both.  In theory, the idea is that averaging reinforces what is not noise across runs.

**3dTcat**
Instead of averaging across runs, you may be interested in concatenating across runs (i.e. treat it like one long run).  This program temporally joins these runs together.  Note: the same thing can be done with `3dbucket`.  Not sure why another program was added, but the name 3dTcat definitely does help convey what it’s purpose it.  

**3dZcat**
Let’s say you have several runs or several subjects that you know you don’t want to average together or temporally concatenate.  However, you will perform all the same analyses on them and would like to combine them in one file so that they can be analyzed and viewed concurrently.   `3dZcat` allows this.  It concatenates along the z dimension.  This can be very useful; however, remember that this ruins the validity of MNI coordinates in the z direction, if you were using those. This is commonly used in the analysis of Multi-echo fMRI data.  

**3dTstat**
This program gives the simple descriptive statistics. It gives statistics that you get by collapsing time, and therefore gives you a 3D map, with one value in each point.  Some examples of what you can compute is the mean value over time, sum over time, standard deviation, etc.  For each statistic you ask for, a map will be created with those values.  These maps will be stored as sub-bricks.  It’s important to remember that this will give you a 4D file, but this file is fundamentally different from the 4D functional data.  Instead of 3 spatial dimensions over time, you will have your 3 spatial dimensions with a value for your first, second, and so on … statistic.  

**3dDeconvolve**
This function will often be used if you are working with task data.  When you have task data, you have external objective timing of when the subject was doing the task.  Now, you want to see where in the brain did activation at pretty much the same time as the task onset and offset.  `3dDeconvolve` uses the general linear model to determine this.  Basically, you give the program the task timing and compare this to the functional data.  The task timing is “convolved” with the hemodynamic response function (HRF).  This is because we don’t expect the activation to be exactly like the task timing, because, for example, it takes time for blood to arrive at and leave the sight of activation.  This can be edited in all different ways  (e.g., tent functions), but the motivation remains the same: where in the brain has to do with the task?  Additionally, this program can take into account nuisance regressors (noise) such as slow trends (linear, quadratic, cubic… models) and the motion parameters from `3dVolreg`.   The outputs of `3dDeconvolve` are maps with statistical values for each voxel, similar to `3dTstat`.  By default, these are the linear regression coefficients (beta weights), t-statistic, and F-statistic.  The beta weights are used to find how much signal change is related to task, and the t-statistic tells you how sure you can be in that result.  

**afni_proc.py**
This python command is a sort of start to finish GUI for fMRI analyses. It is a convenient (and relatively hands-free) way to implement the pre-processing and analyses listed above. Many other fMRI people use this command frequently, even if just to frame their analysis pipeline before making project specific changes. This program is discussed extensively in the AFNI Bootcamp course.  

## Analysis-like Programs (II)

If you are working with rest data, you tools for investigating your data are different from what you would use for task-based data.  For one, you would not typically use `3dDeconvolve`, because you do not have task timing to compare with.  `3dTstat` is often useful, but getting the average activation, or some other equally simple statistic, will rarely give you an interesting result.  Therefore, with rest data, we often want to look into where things in the brain co-vary.  

At this point, if we are interested in the whole brain, we often move over to Matlab or Python, where working with correlation matrices becomes easier to manipulate.  However, there are several more steps we can take in AFNI that will ease in the transition.  Additionally, if you are looking at how a particular timeseries correlates with the rest of the brain, there are plenty of analyses you can do here in AFNI.  Remember, these tools can certainly be used in analysis of task data, but are more prominent in rest analyses.  

**3dmaskave & 3dmaskSVD**
One issue with rest data is that you have a timeseries for every single voxel.  This certainly is useful in some cases, but it often means working with way more data then you need/want/can wrap your head around.  Fortunately, there is a way to simplify your data, with ROI (Region of Interest) analysis.  With ROI analysis, you parcellate the brain into smaller pieces. So, say, instead of looking at the thousands of timeseries for the voxels in V1, you compute a single summary timeseries for V1.  

There are many ways to parcellate the brain.  The templates for where to make the separations generally try to balance these two things: 1) spatial continuity (voxels in that ROI touch other voxels in that same ROI and 2) functional continuity (voxels in that ROI act like voxels in that same ROI).  Some people spend a LOT of time trying to decide how to balance these.  Just pick one. There are many different parcellations out there ([list][parcellation_list] that AFNI provides) that are all different, and which one to use will be a project-specific decision.

Now, with your parcellation template (usually whole brain, with 20 to 500 parcels, aka ROIs), you have a little mask for that parcel (e.g., V1, V2, Auditory, …).  One parcel at a time, you can simplify all the voxels’ timeseries into one timeseries.  There are two easy ways to do this. The first method is `3dmaskave`, which does what it sounds like: takes the voxel mean of all the timeseries. This command give you one .1D file (with the timeseries values) per ROI.  The second method is `3dmaskSVD`.  This will give you a timeseries that is pretty much the first eigenvector of all the voxels’ timeseries in that ROI.   Again, this gives you a single timeseries per ROI, stored in a .1D file.  These files can be easily brought into Matlab or Python, where you can begin looking at correlations between ROIs.  

**3dTcorr1D**
You may be interested in where in the brain is most correlated with a timeseries that you have already extracted.  This timeseries could be from an ROI, a physio trace, a motion tract, a task model, etc.  This program computes that timeseries with all other points in the brain and creates a map.  You can edit which correlation method you want the program to use.  

**3dTcorrelate**
You may be interested to see if a voxels timeseries in one dataset correlates with that same voxels timeseries in another dataset.  To do this, enter both datasets into this program.  The output will be a map of correlation values.  

**3dTcorrMap**
Finally, you may be interested to see where in the brain is most correlated with everywhere else in the brain.  This program correlates every voxel to every other voxel.  That voxels average correlation value is printed to a map.  

**InstaCorr**
This program lies within the AFNI GUI and is not used on the command line like the programs above.  InstaCorr pretty much does that same thing at 3dTcorr1D, but INSTA!   Basically, you hold your mouse over a voxel.  AFNI takes that voxel’s 1D timeseries and computes the correlation to the rest of the brain, giving you an instant map.  You can move the cursor along the brain change the seed 1D timeseries.  This is a great tool for investigating your data.  

[prog_list]: https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/programs/classified_progs.html#edu-class-prog
[parcellation_list]:https://afni.nimh.nih.gov/pub/dist/atlases/afni_atlases_dist/
