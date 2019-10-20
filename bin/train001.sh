model=model001
gpu=0
fold=0
conf=./conf/${model}.py

/data/anaconda3/bin/python -m src.cnn.main train ${conf} --fold ${fold} --gpu ${gpu}
