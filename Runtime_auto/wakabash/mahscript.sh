docker run --name $1 mohit/deb-asan bash run_script.sh $1
docker cp $1*.deb $1:/
docker start -a $1
