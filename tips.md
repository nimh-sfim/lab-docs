# Helpful Tips

## Generate a .tsv file

For things like BIDS, you may need to generate a .tsv file.
We recommend the following procedure:

1. Create your file in Excel
1. Go to File -> Save As -> Tab-delimited text (\*.txt).
1. Accept that there will be potential information loss (note: this means
   you can't use things like formulas)
1. Rename your `.txt` file to a `.tsv` file, with either your operating
   system's renaming function or with

   ```bash
   mv file.txt file.tsv
   ```

If you already have a csv file (comma separated values), you can create a tsv file using:

   ```bash
   sed 's/,/\t/g' file.csv > file.tsv
   ```

## Updating your password

If you get an email telling you that you need to update your password, you should change your password through the black key icon in the top right of your screen. This will ensure that your laptop password and NIH credentials stay synced and you don't get locked out of your laptop.

## PIV Cards and the internet browser

You may run into an issue when trying to authenticate on various NIH sites using your PIV card if you try to check your certificate before your laptop realizes that you have your card inserted. You might find that you get all sorts of funky messages and it won't let you try to authenticate via PIV card again. If this happens, you can try to quit out of your browswer (i.e. `Command + Q` on a Mac) and then re-open your windows. This should allow you to try to find your PIV card again and all should be well. Alternatively, you can try to use an incognito or private browswer window.

## Installing Pylink with PsychoPy 

If you want to do work with eye-tracking, you'll need to install the ```pylink``` package, which comes with the [Eyelink Developer's Kit](https://www.sr-research.com/support/forum-9.html). You can follow their instructions to either [install](https://www.sr-research.com/support/thread-8291.html) via ```pip```, or you can install offline by building the included wheel (```pip install *.whl```, where you will need to use the .whl file associated with your version of Python). 

One important note is that if you wish to use pylink in the context of PsychoPy's Builder or Coder, you need to ensure that the standalone version of Python that is shipped with PsychoPy can access the pylink package. To do so, you should find where the pylink package has been installed to your computer. From there, you will need to copy the whole directory to PsychoPy's version of Python - this is likely somewhere like ```/Applications/PsychoPy.app/Contents/Resources/lib/python3.10``` (although it may be a different version of Python). You can just copy the whole package directory into this folder. If you have installed the package offline via a wheel, you may have to rename the ```pylink_c_somestuffhere.so``` to just ```pylink_c.so```. 
