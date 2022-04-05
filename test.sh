docker build -t mlapp:cpu .

docker run -p 8000:8000 mlapp:cpu



curl Xhttp://127.0.0.1:8000/predict
curl http://127.0.0.1:8000/train

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 681747700094.dkr.ecr.ap-northeast-2.amazonaws.com
docker build -t mlapp .
docker tag mlapp:latest 681747700094.dkr.ecr.ap-northeast-2.amazonaws.com/mlapp:latest
docker push 681747700094.dkr.ecr.ap-northeast-2.amazonaws.com/mlapp:latest


3 pods, AVG 33ms, TPS 148, CPU 88%



docker build -t mlapp-gpu .

docker run -p 8000:8000 mlapp-gpu

docker build -t mlapp-gpu .
docker tag mlapp-gpu:latest 681747700094.dkr.ecr.ap-northeast-2.amazonaws.com/mlapp-gpu:latest
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 681747700094.dkr.ecr.ap-northeast-2.amazonaws.com
docker push 681747700094.dkr.ecr.ap-northeast-2.amazonaws.com/mlapp-gpu:latest
