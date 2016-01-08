
# create environment
mkdir logs

#1. Get a list of packages from binary repo >> packages.list

#2. for each package_name in packages.list:
        # copy .deb file to curent dir
        bash start_container.sh package_name
        rm *.deb
    # end for

