# ffind
ffind uses the 'find' command in Unix/Linux to perform searches for file names that contain a certain word. Currently ffind is limited in it's scope and does not make use of the other features that 'find' offers. But soon those features will be added.

# Compatibility:
- Unix
- Linux
- macOS 10.12+

# How to Use:

1. To launch ffind type: sh ffind.sh
2. The prompt will provide four options: (1) basic (2) advanced (3) help (e) exit
3. Basic Search will perform a search starting in your home directory
4. Advanced Search will start the search in any directory you designate
5. Help will give a list of possible advanced search methods. Note 'currently only wildcard is usable'
6. e does not take much explaining, it will exit the program

# Command Line Arguments:
You no long required to use the command line interface to select your desired search method. ffind will now respond to a limited number of command line inputs. Including ‘-f’ which signals that the user wishes to perform a search. The second argument is ‘-p’ which indicates that the user wishes to designate a search path.

- Example:
sh ffind.sh -f words -p /path/to/my/file

# Upcoming Features: 1.0.1
- Command line arguments
- grep searches
- Handling multple search words
