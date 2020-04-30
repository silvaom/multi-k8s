docker build -t zefhon/multi-client -f ./client/Dockerfile ./client

docker build -t zefhon/multi-worker -f ./worker/Dockerfile ./worker

docker build -t zefhon/multi-server -f ./server/Dockerfile ./server

docker push zefhon/multi-client
docker push zefhon/multi-server
docker push zefhon/multi-worker

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=zefhon/multi-server