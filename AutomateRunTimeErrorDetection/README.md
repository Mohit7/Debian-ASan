# Automate Run Time Error Detection

Till now we have used [runtime_check.sh](https://github.com/Mohit7/Debian-ASan/blob/master/runtime_check.sh) to detect ASan errors while running packages built with ASan flag.

But there are various issues with this approach:
- Some of the executables require input from user, and waits infinitely.
- Some errors stops the script in between, haulting testing of further packages.
- If we do it on a single system, it messes with the system badly as many install/uninstall  
  are involved to fulfill dependencies.
  
To deal with these, we will use seperate docker container for each package, so that system  
will be safe, we can use timeouts to avoid infinite loops, and some random error won't hault  
our testing.
