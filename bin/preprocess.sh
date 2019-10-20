mkdir -p cache model data/submission

# train
/data/anaconda3/bin/python -m src.preprocess.dicom_to_dataframe --input /data/rsna2019/stage_1_train.csv --output ./cache/train_raw.pkl --imgdir /data/rsna2019/stage_1_train_images
/data/anaconda3/bin/python -m src.preprocess.create_dataset --input ./cache/train_raw.pkl --output ./cache/train.pkl
/data/anaconda3/bin/python -m src.preprocess.make_folds --input ./cache/train.pkl --output ./cache/train_folds.pkl --n-fold 5 --seed 10

# test
/data/anaconda3/bin/python -m src.preprocess.dicom_to_dataframe --input /data/rsna2019/stage_1_sample_submission.csv --output ./cache/test_raw.pkl --imgdir /data/rsna2019/stage_1_test_images
/data/anaconda3/bin/python -m src.preprocess.create_dataset --input ./cache/test_raw.pkl --output ./cache/test.pkl
