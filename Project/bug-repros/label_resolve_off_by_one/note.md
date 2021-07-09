# What causes the error
When doing label resolution,the buffer created is only 33 chars long.  
This causes any line longer than 33 chars to be treated as two instructions by the label resolving code.  
Which errorneously shifts the address of all the labels.  
This is caused by either of:
	* A string which is sufficiently long
	* A comment which is after the instruction.

# Solution:
Make the buffer used by label resolving code large enough.  
This is feasible because all instructions are already being trimmed to two words regardless of their size after label resolution.

# How to verify:

    * Switch to master branch in `myexpos/xfs-interface`
    * Run `make` there
    * Run `run.bash` here

    * Switch to bugfix branch in `myexpos/xfs-interface`
    * Run `make` there
    * Run `run.bash` here
