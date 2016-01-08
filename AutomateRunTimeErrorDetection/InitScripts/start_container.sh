docker run --name $1 mohit/deb-asan bash run_script.sh $1 #TODO: Add timeout 
docker cp $1*.deb $1:/
docker start -a $1  
docker cp $1:/$1.log ./logs/
docker rm $1
