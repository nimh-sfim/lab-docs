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

## SSH Keys for GitHub on Biowulf

If you are using Git on Biowulf, you might get some weird fatal errors when you start a new session. If this happens, try to restart the ssh-agent and re-add the key (instructions [here][ssh-add] from GitHub)

[ssh-add]:https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
