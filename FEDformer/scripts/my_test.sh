export CUDA_VISIBLE_DEVICES=0
for model in Autoformer FEDformer Informer Transformer
do

for preLen in 24 48 96
do

for dataset in machine_1932.csv
do

python -u ../run.py \
 --is_training 1 \
 --root_path ../dataset/ \
 --data_path $dataset \
  --task_id test \
  --model $model \
  --data custom \
  --features MS \
  --seq_len 48 \
  --label_len 48 \
  --pred_len $preLen \
  --enc_in 2 \
  --dec_in 2 \
  --c_out 1 \
  --itr 1 \
  --patience 50 \
  --des 'Exp' \
  
python -u ../run.py \
 --is_training 1 \
 --root_path ../dataset/ \
 --data_path $dataset \
  --task_id test \
  --model $model \
  --data custom \
  --features MS \
  --seq_len 48 \
  --label_len 48 \
  --pred_len $preLen \
  --enc_in 2 \
  --dec_in 2 \
  --c_out 1 \
  --des 'Exp' \
  --itr 1 \
  --patience 50 \
  --use_RevIN

done

done

done
