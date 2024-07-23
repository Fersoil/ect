
torchrun --nnodes=1 --nproc_per_node=$1 --rdzv_backend=c10d --rdzv_endpoint=localhost:$2 ct_train.py  \
    --outdir=/mnt/evafs/groups/mi2lab/tkwiecinski/ect/ct-runs --data=/mnt/evafs/groups/mi2lab/bsobieski/ect/datasets/celebahq-256x256.zip  \
    --cond=0 --arch=ncsnpp_celebahq --metrics=fid50k_full        \
    --transfer=/mnt/evafs/groups/mi2lab/tkwiecinski/checkpoints/celebahq_song_sigma_max.pkl    \
    --duration=25.6 --tick=12.8 --double=250 --batch=32 --lr=0.0001 --optim=RAdam --dropout=0.2 --augment=0.0 \
    -q 256 --double 10000 --ema_beta 0.9993  --sample_every 100    --eval_every 100  --snap 50   --batch 32 --batch-gpu 4   \
    ${@:3} 
