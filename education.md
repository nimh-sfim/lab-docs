# Education

Here, we have compiled a list of links to learn more about things that will be useful for the work we do in SFIM. This list is evolving, and if you have suggestions for useful resources, please create a Pull Request and we will work on getting it added.

## Programming

### General

- [Software Carpentry][scarpentry] A series of courses on many useful scientific software skills. It's great to take the course, but one can also go through the classes or read through the teacher guides.
- [MIT's Missing Semester][MIT_semester] MIT's version of Software Carpentry
- [The Turing Way][Turing_Way_general] A book on effective ways to design and support reproducible research. Focuses on coding details as well as guides to building a collaborative and supportive community.
- [Good Research Code Handbook][good_research_code_handbook] by Patrick Mineault

### Unix

Unix will be how you navigate the Terminal and access data on Biowulf. If you aren't already familiar with Unix, check out any of these tutorials to begin familiarizing yourself with it.

- [HPC/Biowulf Bash Course][hpc_bash]
- [Software Carpentry: The Unix Shell][swc_shell]
- [Cornell Linux Tutorial][cornell_linux]
- [AFNI Unix Introduction][afni_unix]

### Git

We use Git and GitHub for version control to manage our work and collaborate across the lab. Below are a few helpful tutorials on the basics of Git, although please also see the [setting up Git] page in the How To's section of lab-docs for a step-by-step tutorial on how to set up a Git repo for a new SFIM project.  

- [Git Primer][git_primer]: Brief primer that may help orient a new user terminology
- [Pro Git][pro_git]: chapters 1 through 3.
- [The Turing Way][turing_way]: "Version Control" (also includes version control for
data).
- [Software Carpentry][software_carpentry_git]: "Version Control With Git."
- [Dang it, Git][dangitgit]: a quick and easy resource for how to get yoruself out of trouble with Git

### Python

- [Coursera specialization by University of Michigan][um_python]
  - [Python for Everybody (Free book for above class)][p4e]
- [Software Carpentry: Programming with Python][swc_python]
- [The Hitchhiker's Guide to Python][hitchhikers_guide_python]
- [Gael Varoquaux's Programming Guides][gv_python] (Varying difficulties)
- [SciPy lecture notes][sp_lecture] (Varying difficulties)
- [Open Tech School iPython][ots_ipyth] (Beginner, notebooks)
- [Python String Format by pyformat][pystr] (Beginner, String Formatting)
- [iPython Advanced Documentation][ipython] (Advanced; reference)
- [Full Stack Python][fsp] (Advanced; process-focused)
- [Awesome Python][awesome] (Reference for Python Frameworks)
- [Chris Yeh's Definitive Guide to Python import statements][cy_import] (For people making packages)
- [Python for the practicing neuroscientist][python_kramer] (more for lower level signal analysis)

### MATLAB

- [Software Carpentry: Programming with MATLAB][swc_matlab]

### MATLAB to Python

If you're looking to make the switch from MATLAB to Python, below are some cheat sheets for making the jump.

- [NumPy guide for MATLAB users][numpy_for_matlab]
- [Numpy vs. MATLAB cheat sheet][numpy_matlab_cheat_sheet]

### Statistics

- [Learn Statistics with R][learn_stats_R]
- [Coursera: Introduction to PCA][intro_PCA]
- [Introduction to Multi-Level Modeling][intro_mlm]
- [A quick intro to ICA][ica_web]

## Neuroscience

### Neuroanatomy

- [Marian Diamond's anatomy course on Youtube][Diamond_class] This is all anatomy, not just the brain, but her brain lectures within the class are a good introduction
- [The Human Brain Coloring Book][Diamond_book] by Marian Diamond & Arnold Scheibel. They believe that tracing paths and regions is key to learning. This is also the clearest neuroanatomy book for someone who doesn't already know most of neuroanatomy. SFIM has some copies, but can also buy for individuals who want to color (or buy yourself, if you might want to keep it)

### Neurovascular Coupling

- Hillman et al "Coupling Mechanism and Significance of the BOLD Signal: A Status Report" Annual Review of Neuroscience 2014 [DOI:10.1146/annurev-neuro-071013-014111](https://doi.org/10.1146/annurev-neuro-071013-014111)
- Handwerker et al "The continuing challenge of understanding and modeling hemodynamic variation in fMRI" NeuroImage 2012 [DOI:10.1016/j.neuroimage.2012.02.015](https://doi.org/10.1016/j.neuroimage.2012.02.015)

## General Cognitive Neuroscience

We're still collecting these resources. Check back later, or submit a pull request to suggest one!

### LBC-specific neuroscience

[Key publications from Leslie Ungerleider][Ungerleider_collection]

## MRI

### Blogs and Websites

- [Andy's Brain Book][andy_brain_book] and [Andy's Brain Blog][andy_brain_blog]: Extensive tutorials and walkthroughs on how to do fMRI analysis across software
- [layerfmri][layerfmri]: Renzo Huber's blog on how to do layer fMRI
- [Spin that resonates][spin_resonates]: Q&A blog on MRI physics
- [practiCal fMRI][practical_fmri]: blog posts on understanding MRI acquisition

### Online Courses/Lectures

- [NIH fMRI Summer Course Videos & Slides][fmri_nih_summer]: Every summer, the NIH runs a series of lectures on fMRI. 2018 is a series of survey lectures and the 2019 lectures address more special topics and big picture questions.
- [AFNI Boot Camp on YouTube][afni_camp_yt]: AFNI Bootcamp is run by the fabulous AFNI team at the NIH. If you haven't been in person, the videos are all on Youtube, and the [handouts][afni_handouts] are available online.
- [UCSD Fundamentals of Functional Neuroimaging 2020 by Tom Liu]
[Tom_Liu_MRI]
- Principles of fMRI by Martin Lindquist
  - [Part One - Coursera][p_fmri_1]
  - [Part Two - Coursera][p_fmri_2]
  - [Youtube (open-source)][p_fmri_youtube]
- [Assaf Tal Lectures][physics_mri]: Lectures on MRI physics
- [Neurohackademy][neurohack]: Neurohackademy is a summer course hosted by UW that focuses on the intersection of data science and neuroscience. In addition to their machine learning course, they have other great educational material, so check out the other lectures as well.
- [DartBrains][dartbrains]: Dartmouth course (created by Luke Chang) geared towards analyzing fMRI data in Python.

### Books

Some of these books are available online and others we might have hard copies. Ask lab members for access.

- Functional Magnetic Resonance Imaging by Huettel, Song, & McCarthy (designed for undergrad introductory courses and probably the best survey of all relevant topics for someone new to neuroimaging with MRI)
- [The Basics of MRI, Joseph P. Hornak][basics_mri] (intro to MRI physics basics)
- Introduction to Functional Magnetic Resonance Imaging by Richard Buxton (good intro to contrasts beyond BOLD, but last edition was 2010, before VASO and other contrasts got big)
- Principles of Magnetic Resonance Imaging by Liang & Lauterbur (more physics and signal processing perspective)
- Magnetic Resonance Imaging by Dwight Nishimura (electrical engineering / signal processing perspective)
- MRI: The Basics by Hashemi, Bradley, & Lisanti (designed for radiologists to help them understand contrasts without advanced physics)

[andy_brain_book]: https://andysbrainbook.readthedocs.io/en/latest/index.html
[andy_brain_blog]: https://www.andysbrainblog.com
[layerfmri]: https://layerfmri.com
[spin_resonates]: http://spinthatresonates.blogspot.com
[practical_fmri]: https://practicalfmri.blogspot.com
[fmri_nih_summer]: https://fmrif.nimh.nih.gov/index.php/SummerCourse
[basics_mri]: http://www.cis.rit.edu/htbooks/mri/inside.htm
[afni_camp_yt]: https://www.youtube.com/channel/UC40RiNZN7_dCuB6Lg7HJl1g
[Tom_Liu_MRI]: https://www.youtube.com/playlist?list=PLn7hWU9T1O6FExueed50s9Wl98dzSLmXL
[p_fmri_1]: https://www.coursera.org/learn/functional-mri
[p_fmri_2]: https://www.coursera.org/learn/functional-mri-2
[neurohack]: https://neurohackademy.org/course_type/lectures/
[afni_handouts]: https://afni.nimh.nih.gov/class_handouts
[p_fmri_youtube]: https://www.youtube.com/channel/UC_BIby85hZmcItMrkAlc8eA/videos
[physics_mri]: https://www.weizmann.ac.il/chembiophys/assaf_tal/lecture-notes
[dartbrains]: https://dartbrains.org/content/intro.html
[Diamond_class]: <https://youtu.be/S9WtBRNydso>
[Diamond_book]: <https://www.harpercollins.com/products/the-human-brain-coloring-book-marian-c-diamondarnold-b-scheibel>
[Ungerleider_collection]: <https://www.jneurosci.org/collection/remembering-leslie-ungerleider>
[git_primer]: <https://voyteklab.com/git/git-primer/>
[pro_git]: <https://git-scm.com/book/en/v2>
[turing_way]: <https://the-turing-way.netlify.app/reproducible-research/vcs.html>
[software_carpentry_git]: <http://swcarpentry.github.io/git-novice/>
[scarpentry]: <https://software-carpentry.org/>
[MIT_semester]: <https://missing.csail.mit.edu/>
[Turing_Way_general]: <https://the-turing-way.netlify.app/welcome>
[good_research_code_handbook]: <https://goodresearch.dev/>
[swc_shell]: <http://swcarpentry.github.io/shell-novice/>
[cornell_linux]: <https://cvw.cac.cornell.edu/Linux>
[afni_unix]: <https://afni.nimh.nih.gov/pub/dist/edu/data/CD.expanded/AFNI_data6/unix_tutorial/index.html>
[um_python]: <https://www.coursera.org/specializations/python>
[p4e]: <https://www.py4e.com/book.php>
[swc_python]: <https://swcarpentry.github.io/python-novice-inflammation/>
[gv_python]: <http://gael-varoquaux.info/programming/improving-your-programming-style-in-python.html>
[sp_lecture]: <https://scipy-lectures.org>
[ots_ipyth]: <http://opentechschool.github.io/python-data-intro/core/notebook.html>
[pystr]: <https://pyformat.info>
[ipython]: <https://ipython.readthedocs.io/en/stable/>
[fsp]: <https://www.fullstackpython.com>
[awesome]: <https://github.com/vinta/awesome-python>
[python_kramer]: <https://elifesciences.org/labs/f779833b/python-for-the-practicing-neuroscientist-an-online-educational-resource>
[swc_matlab]: <http://swcarpentry.github.io/matlab-novice-inflammation/>
[cy_import]: <https://chrisyeh96.github.io/2017/08/08/definitive-guide-python-imports.html>
[hpc_bash]: <https://hpc.nih.gov/training/bash_class/>
[numpy_for_matlab]: https://numpy.org/doc/stable/user/numpy-for-matlab-users.html
[numpy_matlab_cheat_sheet]: http://mathesaurus.sourceforge.net/matlab-numpy.html
[intro_PCA]: https://www.coursera.org/learn/pca-machine-learning?courseSlug=pca-machine-learning&showOnboardingModal=check
[dangitgit]: https://dangitgit.com/en
[hitchhikers_guide_python]: https://docs.python-guide.org/
[intro_mlm]:https://www.learn-mlms.com/
[learn_stats_R]:https://learningstatisticswithr.com/
[ica_web]: https://towardsdatascience.com/independent-component-analysis-ica-a3eba0ccec35
