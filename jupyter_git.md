# Jupyter and Git
Git does not play well with jupyter notebook, which is unfortunate since so
many people use it to do good science.
There are no particularly good ways to handle version control and jupyter
notebook, but the currently recommended way is as as follows:
1. Using miniconda, install jupyter and jupytext.
   This can be done with
   ```
   conda install jupyter
   conda install -c conda-forge jupytext
   ```
1. Create your notebook as you'd like it.
1. Assuming your file is called something like `notes.ipynb`, run the
   following command:
   ```
   jupytext --to py notes.ipynb
   ```
1. Commit the resulting file, `notes.py`, but DO NOT commit the python
   notebook file.
1. In order to generate a notebook back from the python file, you can run
   ```
   jupytext --to ipynb notes.py
   ```
An additional recommendation is to add the following line to your
`.gitignore` for your project:
```
*.ipynb
```
to make sure you don't accidentally track a notebook.
