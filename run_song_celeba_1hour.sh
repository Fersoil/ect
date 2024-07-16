
torchrun --nnodes=1 --nproc_per_node=$1 --rdzv_backend=c10d --rdzv_endpoint=localhost:$2 ct_train.py  \
    --outdir=ct-runs --data=/storage/icm/datasets/celebahq-256x256.zip  \
    --cond=0 --arch=ncsnpp_celebahq --metrics=fid50k_full        \
    --transfer=/storage/ect/celebahq_song_sigma_max.pkl    \
    --duration=25.6 --tick=12.8 --double=250 --batch=2 --lr=0.0001 --optim=RAdam --dropout=0.2 --augment=0.0 \
    -q 256 --double 10000 --ema_beta 0.9993 --eval_every 80 --dump 80     \
    ${@:3}
